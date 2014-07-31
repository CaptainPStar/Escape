//// REINFORCEMENTTRUCK
private ["_enemyMinSkill","_enemyMaxSkill","_enemyFrequency","_spawnSegment"];


_enemyMinSkill = _this select 0;
_enemyMaxSkill = _this select 1;
_enemyFrequency = _this select 2;


_spawnSegment = [(call drn_fnc_Escape_GetPlayerGroup), 1500, 2000] call drn_fnc_Escape_FindSpawnSegment;
while {(str _spawnSegment) == """NULL"""} do {
	_spawnSegment = [(call drn_fnc_Escape_GetPlayerGroup), 1500, 2000] call drn_fnc_Escape_FindSpawnSegment;
	sleep 1;
};

[getPos _spawnSegment, _enemyMinSkill, _enemyMaxSkill, _enemyFrequency,  drn_var_Escape_debugReinforcementTruck] execVM "Scripts\Escape\CreateReinforcementTruck.sqf";