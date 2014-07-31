if (!isServer) exitWith {};


private ["_chopper","_dropPosition","_onGroupDropped","_debug","_chopNo","_group","_waypoint","_dropUnits","_smoke","_flare","_chem","_openHeight","_para","_smokes","_flares","_chems","_dropGroup","_unit","_droppedNo","_i"];


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


if (_debug) then {
	//"SmokeShellRed" createVehicle _dropPosition;
	createVehicle ["SmokeShellRed", _dropPosition, [], 0, "NONE"];
	player sideChat "Drop chopper moving out...";
};

_chopper flyInHeight 200;
_chopper engineOn true;
_chopper move [position _chopper select 0, position _chopper select 1, 100];
while {(position _chopper) select 2 < 100} do {
	sleep 1;
};

_waypoint = _group addWaypoint [_dropPosition, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""waypointFulfilled"", true];"];


_waypoint = _group addWaypoint [getPos _chopper, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
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
	
_i = 0;
	
	for "_i" from 0 to 3 step 1 do {
	
	_unit = (_dropUnits select _droppedNo);
	
	
	unassignVehicle _unit;
	_unit setPos [(getPos _chopper) select 0,(getPos _chopper) select 1, ((getPos _chopper) select 2) - 5];
	_openHeight = 100;	
	_smokes = true;
	_flares = true;
	_chems = true;
	
		// _unit action ["eject", _chopper]; 
        // waitUntil {vehicle _unit != _chopper};
	waitUntil{((getPos _unit)select 2)<_openHeight};
		
	_para = createVehicle ["NonSteerable_Parachute_F", position _unit, [], ((direction _chopper)-25+(random 50)), 'NONE'];
	_para setPos (getPos _unit);
	_unit moveInDriver _para;
	
	if(_smokes)then{
		waitUntil{((getPos _unit)select 2)<10};
		//_smoke = "SmokeShell" createVehicle (getPos _man2);
		_smoke = createVehicle ["SmokeShell", (getPos _unit), [], 0, "NONE"];
	};
	if(_flares)then{
		waitUntil{((getPos _unit)select 2)<5};
		//_flare = "F_40mm_Red" createVehicle [(getPos _man2) select 0,(getPos _man2) select 1,0]; //Chemlight_red
		_flare = createVehicle ["F_40mm_Red", [(getPos _unit) select 0,(getPos _unit) select 1,0], [], 0, "NONE"];
	};
	if(_chems)then{
		waitUntil{((getPos _unit)select 2)<2};
		//_chem = "Chemlight_red" createVehicle (getPos _man2);
		_chem = createVehicle ["Chemlight_red", (getPos _unit), [], 0, "NONE"];
	};
	_droppedNo = _droppedNo + 1;
		
		sleep .3;
	};
	
	
	
	

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






