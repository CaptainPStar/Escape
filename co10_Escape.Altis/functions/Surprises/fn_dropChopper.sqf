//// DROPCHOPPER
private ["_enemyFrequency","_noOfDropUnits","_dropGroup","_soldierType","_soldier","_dropUnits","_i","_dropPosition","_onGroupDropped","_chopSPAWNpos","_minEnemySkill","_maxEnemySkill","_playerPosX","_playerPosY"];

_minEnemySkill = _this select 0;
_maxEnemySkill = _this select 1;
_enemyFrequency = _this select 2;

_noOfDropUnits = (_enemyFrequency + 2) + floor random (_enemyFrequency * 2);

_dropGroup = createGroup east;
_dropUnits = [];

for [{_i = 0}, {_i < _noOfDropUnits}, {_i = _i + 1}] do {
	_soldierType = a3n_arr_recon_InfantryTypes select floor (random count a3n_arr_recon_InfantryTypes);
	_soldier = _dropGroup createUnit [_soldierType, [0,0,30], [], 0, "FORM"];
	//_soldier setSkill (_minEnemySkill + random (_maxEnemySkill - _minEnemySkill));
	//[_soldier, drn_var_Escape_enemyMinSkill] call EGG_EVO_skill;
	_soldier setRank "CAPTAIN";
	_soldier call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
	_dropUnits set [_i, _soldier];
};

_playerPosX = (getPos player select 0);
_playerPosY = (getPos player select 1);
_chopSPAWNpos = [];

if ((_playerPosX + 2000) > A3E_WorldSize  || (_playerPosX + 2000) > A3E_WorldSize) then 

	{
	_chopSPAWNpos = [(_playerPosX - 2000), (_playerPosY - 2000),300];
	//hintsilent "spawn SW";
	}
	else
	{
	_chopSPAWNpos = [(_playerPosX + 2000), (_playerPosY + 2000),300];
	//hintsilent "spawn NE";
	};
diag_log _chopSPAWNpos;
	
_dropPosition = [drn_searchAreaMarkerName] call drn_fnc_CL_GetRandomMarkerPos;

_onGroupDropped = {
	private ["_group", "_dropPos"];
	
	_group = _this select 0;
	_dropPos = _this select 1;
	
	//[_group, drn_searchAreaMarkerName, _dropPos, drn_var_Escape_DebugSearchGroup] execVM "Scripts\DRN\SearchGroup\SearchGroup.sqf";
	[_group, drn_searchAreaMarkerName, _dropPos, drn_var_Escape_DebugSearchGroup] spawn DRN_fnc_SearchGroup;
};

[_chopSPAWNpos, east, "O_Heli_Light_02_unarmed_F", "O_Pilot_F", _dropUnits, _dropPosition, _minEnemySkill, _maxEnemySkill, _onGroupDropped, drn_var_Escape_debugDropChoppers] execVM "Scripts\Escape\CreateDropChopper.sqf";
