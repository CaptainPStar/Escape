private ["_centerPos","_rotateDir","_object","_object2","_objectName","_objectName2","_pos","_dir","_artNumber","_artNumber2","_grp","_marker","_trigger"];

_centerPos = _this select 0;
_artNumber = _this select 1;
_artNumber2 = _artNumber + 1;
_referenceGroup = _this select 2;
_rotateDir = random 360;
_dir = _rotateDir;
_grp = createGroup EAST;

_insNo = 0;
_insNo = ((_artNumber - 1) / 2);


	
// 1st Arti
if (random 100 < 30) then {

_pos = [(_centerPos select 0) - 2, (_centerPos select 1) + 2, 0];
_object = createVehicle ["O_MBT_02_arty_F", _pos, [], 0, "FORM"];
_objectName = "arti_" + str _artNumber;
_object setVehicleVarName _objectName;
_object setVehicleArmor 1;
_object setUnitRank "PRIVATE";
_object setFuel 1;
_object setVehicleAmmo 1;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir (_dir + 180);
createVehicleCrew _object;
{
_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
//_x disableAI "MOVE";
} forEach crew _object;

(driver _object) disableAI "MOVE";

} else {

_pos = [(_centerPos select 0) - 2, (_centerPos select 1) + 2, 0];
_object = createVehicle ["O_Mortar_01_F", _pos, [], 0, "FORM"];
_objectName = "arti_" + str _artNumber;
_object setVehicleVarName _objectName;
_object setVehicleArmor 1;
_object setUnitRank "PRIVATE";
_object setFuel 1;
_object setVehicleAmmo 1;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir (_dir + 180);
createVehicleCrew _object;
{
_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
//_x disableAI "MOVE";
} forEach crew _object;
};

// 2nd Arti

_pos = [(_centerPos select 0) + 2, (_centerPos select 1) - 2, 0];
_object2 = createVehicle ["O_Mortar_01_F", _pos, [], 0, "FORM"];
_objectName2 = "arti_" + str _artNumber2;
_object2 setVehicleVarName _objectName2;
_object2 setVehicleArmor 1;
_object2 setUnitRank "PRIVATE";
_object2 setFuel 1;
_object2 setVehicleAmmo 1;
_object2 setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object2 setDir (_dir + 180);
createVehicleCrew _object2;
{
_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
//_x disableAI "MOVE";
} forEach crew _object2;

a3e_var_artillery_units  = a3e_var_artillery_units  + [_object,_object2];

//diag_log "___ Artillery ___";
//diag_log _objectName;
//diag_log _objectName2;

//Art markers

_marker = createMarkerLocal ["drn_ArtilleryPosition" + str _insNo, _centerPos];


_marker setMarkerShape "ICON";
_marker setMarkerType "mil_unknown";

_artiTrigName = "drn_ArtilleryPosition";

_trigger = createTrigger["EmptyDetector", _centerPos];
_trigger triggerAttachVehicle [vehicle (units _referenceGroup select 0)];
_trigger setTriggerArea[300, 300, 0, false];
_trigger setTriggerActivation["MEMBER", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, true];
_trigger setTriggerStatements["this", " _nil = [" + str _artiTrigName + ", " + str _insNo + "] spawn A3E_fnc_markerChange;", ""];
	
// Flag

_dir = 90 + _rotateDir;

_pos = [(_centerPos select 0) + 7, (_centerPos select 1) + 5, 0];
//_object = "Flag_AAD_F" createVehicle _pos;
_object = createVehicle ["Flag_AAF_F", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

/*
// Player combat trigger
_trigger = createTrigger["EmptyDetector", _centerPos];
_trigger triggerAttachVehicle [_object];
_trigger setTriggerArea[30, 30, 0, false];
_trigger setTriggerActivation["WEST", "PRESENT", false];
_trigger setTriggerStatements["this", "_nil = [thisTrigger] spawn AoW_fnc_artCombatMode", ""];
*/