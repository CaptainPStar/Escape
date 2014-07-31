if (!isServer) exitWith {};


private ["_spawnPos","_minSkill","_maxSkill","_onGroupDropped","_dropUnits","_debug","_chopper","_group","_pilot","_gunner1","_currentInstanceNo","_crewType","_chopperType","_dropPosition","_vehicleVarName","_noOfDropUnits","_i","_soldierType","_soldier","_squad","_enemyFrequency","_dropGroup"];


_spawnPos = _this select 0;
_squad = _this select 1;
_chopperType = _this select 2;
_crewType = _this select 3;
_dropUnits = _this select 4;
_dropPosition = _this select 5;
_enemyFrequency = _this select 6;
if (count _this > 7) then {_minSkill = _this select 7;} else {_minSkill = 0.3;};
if (count _this > 8) then {_maxSkill = _this select 8;} else {_maxSkill = 0.5;};
if (count _this > 9) then {_onGroupDropped = _this select 9;} else {_onGroupDropped = {};};
if (count _this > 10) then {_debug = _this select 10;} else {_debug = false;};

if (_debug) then {
    player sideChat "Creating drop chopper...";
};

if (isNil "drn_CreateDropChopper_CurrentInstanceNo") then {
	drn_CreateDropChopper_CurrentInstanceNo = 1;
};

if (drn_CreateDropChopper_CurrentInstanceNo > 5) then {
	drn_CreateDropChopper_CurrentInstanceNo = 1;
//	diag_log "Chopper instance reset";
};

_currentInstanceNo = drn_CreateDropChopper_CurrentInstanceNo;
drn_CreateDropChopper_CurrentInstanceNo = drn_CreateDropChopper_CurrentInstanceNo + 1;
//diag_log "==========================================";
//diag_log "drn_CreateDropChopper_CurrentInstanceNo =";
//diag_log drn_CreateDropChopper_CurrentInstanceNo;
//diag_log "_currentInstanceNo";
//diag_log _currentInstanceNo;
//diag_log "==========================================";
//_chopper = _chopperType createVehicle _spawnPos;
_chopper = createVehicle [_chopperType, _spawnPos, [], 0, "FLY"];
_vehicleVarName = "drn_searchChopper" + str _currentInstanceNo;
_chopper setVehicleVarName _vehicleVarName;
_chopper Call Compile Format ["%1 = _this; PublicVariable ""%1""", _vehicleVarName];
_chopper setCaptive true;
//_chopNo = _currentInstanceNo;


_dropGroup = createGroup east;
_group = createGroup east;
_noOfDropUnits = 2;

switch (_enemyFrequency) do {
	case 1:
	{
	_noOfDropUnits = 4;
	};
	
	case 2:
	{
	_noOfDropUnits = 5;
	};
	
	case 3:
	{
	_noOfDropUnits = 6;
	};
};
// Pilot and co-pilot
_group createUnit [_crewType, [0, 0, 30], [], 0, "FORM"];
_group createUnit [_crewType, [0, 0, 30], [], 0, "FORM"];
_pilot = (units _group) select 0;
_gunner1 = (units _group) select 1;
_pilot assignAsDriver _chopper;
_pilot moveInDriver _chopper;
//_pilot disableAI "FSM"; 
_pilot disableAI "TARGET"; 
_pilot disableAI "AUTOTARGET"; 
_gunner1 assignAsGunner _chopper;
_gunner1 moveInTurret [_chopper, [0]];

{
    _x setUnitRank "LIEUTNANT";
    _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
} foreach units _group;

	_i = 0;
	
	for [{_i = 0}, {_i < _noOfDropUnits}, {_i = _i + 1}] do {
		_soldierType = a3n_arr_recon_InfantryTypes select floor (random count a3n_arr_recon_InfantryTypes);
		_soldier = _dropGroup createUnit [_soldierType, [0,0,30], [], 0, "FORM"];		
		_soldier setRank "CAPTAIN";
		_soldier call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
		_soldier setGroupId [_squad];
//		_vehicleVarName = "drn_searchChopper" + str _currentInstanceNo;
		
//		_totalNo = _i + _dropNo;
		_dropUnits set [_i, _soldier];
		removeBackpack _soldier; //remove the backpack
		//_soldier addBackpack "b_parachute"; //add the parachute
		_soldier moveInCargo _chopper;
		_soldier assignAsCargo _chopper;

	};
	
[_chopper, _dropUnits, _dropPosition, _squad, _onGroupDropped, _debug] spawn A3E_fnc_RoyDropChopper;



