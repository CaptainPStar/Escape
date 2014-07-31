//// CIVILIANENEMY
private ["_enemyMinSkill", "_enemyMaxSkill", "_enemyFrequency"];


_enemyMinSkill = _this select 0;
_enemyMaxSkill = _this select 1;
_enemyFrequency = _this select 2;


_spawnSegment = [(call drn_fnc_Escape_GetPlayerGroup), 1500, 2000] call drn_fnc_Escape_FindSpawnSegment;
while {(str _spawnSegment) == """NULL"""} do {
	_spawnSegment = [(call drn_fnc_Escape_GetPlayerGroup), 1500, 2000] call drn_fnc_Escape_FindSpawnSegment;
	sleep 1;
};

[call drn_fnc_Escape_GetPlayerGroup, getPos _spawnSegment, east, drn_arr_Escape_EnemyCivilianCarTypes, a3n_arr_recon_InfantryTypes, _enemyFrequency, drn_var_Escape_debugCivilEnemy] execVM "Scripts\Escape\CreateCivilEnemy.sqf";