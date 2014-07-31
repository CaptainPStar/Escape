//// STOLEN A-164
private ["_enemyFrequency","_chopper","_group","_minEnemySkill","_maxEnemySkill"];

_minEnemySkill = _this select 0;
_maxEnemySkill = _this select 1;
_enemyFrequency = _this select 2;

//_chopper = "O_Heli_Light_02_F" createVehicle getMarkerPos "drn_russianSearchChopperStartPosMarker";
_chopper = createVehicle ["B_Plane_CAS_01_F", (getMarkerPos "A164_spwn"), [], 0, "FLY"];
_chopper lock false;
_chopper setVehicleVarName "drn_russianSearchChopper";
_chopper call compile format ["%1=_this;", "drn_russianSearchChopper"];

_group = createGroup east;

//"O_Pilot_F" createUnit [[0, 0, 30], _group, "", (_minEnemySkill + random (_maxEnemySkill - _minEnemySkill)), "LIEUTNANT"];
//"O_Pilot_F" createUnit [[0, 0, 30], _group, "", (_minEnemySkill + random (_maxEnemySkill - _minEnemySkill)), "LIEUTNANT"];
_group createUnit ["O_Pilot_F", [0, 0, 30], [], 0, "FORM"];
//_group createUnit ["O_Pilot_F", [0, 0, 30], [], 0, "FORM"];

((units _group) select 0) assignAsDriver _chopper;
((units _group) select 0) moveInDriver _chopper;
//((units _group) select 1) assignAsGunner _chopper;
//((units _group) select 1) moveInGunner _chopper;

{
	_x setUnitRank "LIEUTNANT";
	_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
} foreach units _group;

//[_chopper, drn_searchAreaMarkerName, (5 + random 15), (5 + random 15), drn_var_Escape_debugSearchChopper] execVM "Scripts\DRN\SearchChopper\SearchChopper.sqf";
[_chopper, drn_searchAreaMarkerName, (5 + random 15), (5 + random 15), drn_var_Escape_debugSearchChopper] spawn DRN_fnc_SearchChopper;
                  
