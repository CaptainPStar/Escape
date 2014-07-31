if (!isServer) exitWith {};

private ["_chopper","_dropPosition","_onGroupDropped","_debug","_chopNo","_group","_waypoint","_dropUnits","_dropGroup","_smokeColours","_flareColours","_chemlightColours","_smokeName","_flareName","_chemlightName","_droppedNo","_unit"];

_chopper = _this select 0;
_dropUnits = _this select 1;
_dropPosition = _this select 2;
_chopNo = _this select 3;
if (count _this > 4) then {_onGroupDropped = _this select 4;} else {_onGroupDropped = {};};
if (count _this > 5) then {_debug = _this select 5;} else {_debug = false;};



_group = group _chopper;

if (_debug) then {
    player sideChat "Starting drop chopper script...";
};

if (vehicleVarName _chopper == "") exitWith {
	sleep 5;
	player sideChat "Drop chopper must have a name. Script exiting.";
};

_chopper setVariable ["waypointFulfilled", false];
_chopper setVariable ["missionCompleted", false];

//	diag_log "_dropPosition";
//	diag_log _dropPosition;
//	diag_log "==========================================";
//	diag_log "_chopNo";
//	diag_log _chopNo;
//	diag_log "==========================================";
//	diag_log "_onGroupDropped";
//	diag_log _onGroupDropped;
//	diag_log "==========================================";
//	diag_log "_debug";
//	diag_log _debug;
//	diag_log "==========================================";
//	diag_log "++++++++++++++++++++++++++++++++++++++++++";
//	diag_log "==========================================";

if (_debug) then {
	//"SmokeShellRed" createVehicle _dropPosition;
	createVehicle ["SmokeShellRed", _dropPosition, [], 0, "NONE"];
	player sideChat "Drop chopper moving out...";
};

_chopper flyInHeight 300;
_chopper engineOn true;
//_chopper move [position _chopper select 0, position _chopper select 1, 300];
//while {(position _chopper) select 2 < 100} do {
//	sleep 1;
//};

_waypoint = _group addWaypoint [_dropPosition, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""waypointFulfilled"", true];"];


_waypoint = _group addWaypoint [getPos _chopper, 50];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""missionCompleted"", true];"];

	while {!(_chopper getVariable "waypointFulfilled")} do {
		sleep 1;
	};

	if (_debug) then {
		player sideChat "Drop chopper dropping cargo...";
	};

	
	_droppedNo = 0;
	_unit = 0;
// Dropping loop	

	{

		
		//_x allowDamage FALSE; //god mode :)
		
		_x disableAI "ANIM"; //disable the AI animation so they cant switch back to standing
		unassignVehicle _x;
		_x switchMove "HaloFreeFall_non"; //place the AI into the free fall animation
		_x setPos [(getPos _chopper) select 0,(getPos _chopper) select 1, ((getPos _chopper) select 2) - 5];
		
		// _x action ["eject", _chopper]; 
        // waitUntil {vehicle _x != _chopper};
		_smokeColours = [];
		_flareColours = [];
		_chemlightColours = [];
		_smokeName = 0;
		_flareName = 0;
		_chemlightName = 0;
		
		[_x,_chopper,100,true,true,true] spawn{
			private ["_man2","_chopper","_openHeight","_smokes","_flares","_chems","_smoke","_flare","_chem","_smokeColours","_flareColours","_chemlightColours","_smokeName","_flareName","_chemlightName"];
			_man2 = _this select 0;
			_chopper = _this select 1;
			_openHeight = _this select 2;
			_smokes = _this select 3;
			_flares = _this select 4;
			_chems = _this select 5;
			waitUntil{((getPos _man2)select 2)<_openHeight};
			_man2 addBackpack "b_parachute"; //add the parachute
			//_man2 action ["OpenParachute", _man2];
			//_para = createVehicle ["NonSteerable_Parachute_F", position _man2, [], ((direction _chopper)-25+(random 50)), 'NONE'];
			//_para setPos (getPos _man2);
			//_man2 moveInDriver _para;
			waitUntil {isTouchingGround _man2 || (getPos _man2 select 2) < 1};
			_man2 enableAI "ANIM";  //enable the animations
			_man2 setPos [(getPos _man2 select 0), (getPos _man2 select 1), 0]; //this removes the unit from the parachute
			_man2 setVelocity [0,0,0]; //set speed to zero
			_man2 setVectorUp [0,0,1]; //set the unit upright
			sleep 1;
			//_man2 allowDamage TRUE; //allow unit to be damaged again
			
			_smokeColours = ["SmokeShell", "SmokeShellRed", "SmokeShellGreen", "SmokeShellBlue", "SmokeShellOrange", "SmokeShellPurple"];
			_flareColours = ["F_40mm_White", "F_40mm_Green", "F_40mm_Red", "F_40mm_Yellow"];
			_chemlightColours = ["Chemlight_red", "Chemlight_blue", "Chemlight_green"];
			
			_smokeName = _smokeColours select floor random count _smokeColours;
			_flareName = _flareColours select floor random count _flareColours;
			_chemlightName = _chemlightColours select floor random count _chemlightColours;
			
			if(_smokes)then{
				waitUntil{((getPos _man2)select 2)<10};
				//_smoke = "SmokeShell" createVehicle (getPos _man2);
				_smoke = createVehicle [_smokeName, (getPos _man2), [], 0, "NONE"];
			};
			if(_flares)then{
				waitUntil{((getPos _man2)select 2)<5};
				//_flare = "F_40mm_Red" createVehicle [(getPos _man2) select 0,(getPos _man2) select 1,0]; //Chemlight_red
				_flare = createVehicle [_flareName, [(getPos _man2) select 0,(getPos _man2) select 1,0], [], 0, "NONE"];
			};
			if(_chems)then{
				waitUntil{((getPos _man2)select 2)<2};
				//_chem = "Chemlight_red" createVehicle (getPos _man2);
				_chem = createVehicle [_chemlightName, (getPos _man2), [], 0, "NONE"];
			};
		};
		
		sleep .3;
	} forEach _dropUnits;
	
	
	
	

    _dropUnits = units (group (_dropUnits select 0));
    _dropGroup = group (_dropUnits select 0);
    [_dropGroup, _dropPosition] call _onGroupDropped;
    
	while {!(_chopper getVariable "missionCompleted")} do {
		sleep 1;
	};

	if (_debug) then {
		player sideChat "Drop chopper terminating...";
	};

	{
		deleteVehicle _x;
	} foreach units group _chopper;
	deleteVehicle _chopper;






