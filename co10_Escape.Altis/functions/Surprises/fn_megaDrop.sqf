//// DROPCHOPPER

private ["_enemyFrequency","_dropGroup","_dropUnits","_dropPosition","_onGroupDropped","_minEnemySkill","_maxEnemySkill","_playerPosX","_playerPosY","_chopSPAWNposSW","_chopSPAWNposNW","_chopSPAWNposNE","_chopSPAWNposSE","_dropNo","_choppas","_squad"];


_minEnemySkill = _this select 0;
_maxEnemySkill = _this select 1;
_enemyFrequency = _this select 2;


drn_CreateDropChopper_CurrentInstanceNo = 0;
_dropGroup = createGroup east;
_dropUnits = [];


//debug - drop on start position!!!
if (isnil "extractPosition") then {
hintsilent "extractPosition is undefined!";
extractPosition = [];
extractPosition = drn_startPos;
};

_playerPosX = (extractPosition select 0);
_playerPosY = (extractPosition select 1);
_chopSPAWNposSW = [(_playerPosX - 1000), (_playerPosY - 1000),200];
_chopSPAWNposNW = [(_playerPosX - 1000), (_playerPosY + 1000),200];
_chopSPAWNposNE = [(_playerPosX + 1000), (_playerPosY + 1000),200];
_chopSPAWNposSE = [(_playerPosX + 1000), (_playerPosY - 1000),200];

_dropNo = 0;
_choppas = 0;
_dropUnits = [];

//// Choppers



	///////////////////////////////////
	///// DROP CHOP /////////
	_onGroupDropped = {
		private ["_group", "_dropPos"];
		
		_group = _this select 0;
		_dropPos = _this select 1;
		
		[_group, drn_searchAreaMarkerName, _dropPos, drn_var_Escape_DebugSearchGroup] spawn DRN_fnc_SearchGroup;
	};
	_dropUnits = [];
	_squad = "Alpha";
		_dropPosition = [(extractPosition select 0) - 60,(extractPosition select 1) - 60,0];
        [_chopSPAWNposSW, _squad, "O_Heli_Light_02_unarmed_F", "O_Pilot_F", _dropUnits, _dropPosition, _enemyFrequency, _minEnemySkill, _maxEnemySkill, _onGroupDropped, drn_var_Escape_debugDropChoppers] spawn A3E_fnc_RoyCreateDropChopper;
	///////////////////////////////////	
sleep 8;		
	///////////////////////////////////
	///// DROP CHOP 2/////////
	_onGroupDropped = {
		private ["_group", "_dropPos"];
		
		_group = _this select 0;
		_dropPos = _this select 1;
		
		[_group, drn_searchAreaMarkerName, _dropPos, drn_var_Escape_DebugSearchGroup] spawn DRN_fnc_SearchGroup;
	};
	_dropUnits = [];
	_squad = "Beta";
		_dropPosition = [(extractPosition select 0) - 60,(extractPosition select 1) + 60,0];
        [_chopSPAWNposSE, _squad, "O_Heli_Light_02_unarmed_F", "O_Pilot_F", _dropUnits, _dropPosition, _enemyFrequency, _minEnemySkill, _maxEnemySkill, _onGroupDropped, drn_var_Escape_debugDropChoppers] spawn A3E_fnc_RoyCreateDropChopper;
	///////////////////////////////////	
sleep 8;
	///////////////////////////////////
	///// DROP CHOP 3/////////
	_onGroupDropped = {
		private ["_group", "_dropPos"];
		
		_group = _this select 0;
		_dropPos = _this select 1;
		
		[_group, drn_searchAreaMarkerName, _dropPos, drn_var_Escape_DebugSearchGroup] spawn DRN_fnc_SearchGroup;
	};
	_dropUnits = [];
	_squad = "Charlie";
		_dropPosition = [(extractPosition select 0) - 60,(extractPosition select 1) + 60,0];
        [_chopSPAWNposNW, _squad, "O_Heli_Light_02_unarmed_F", "O_Pilot_F", _dropUnits, _dropPosition, _enemyFrequency, _minEnemySkill, _maxEnemySkill, _onGroupDropped, drn_var_Escape_debugDropChoppers] spawn A3E_fnc_RoyCreateDropChopper;
	///////////////////////////////////	
sleep 8;		
	///////////////////////////////////
	///// DROP CHOP 4/////////
	_onGroupDropped = {
		private ["_group", "_dropPos"];
		
		_group = _this select 0;
		_dropPos = _this select 1;
		
		[_group, drn_searchAreaMarkerName, _dropPos, drn_var_Escape_DebugSearchGroup] spawn DRN_fnc_SearchGroup;
	};
	_dropUnits = [];
	_squad = "Delta";
		_dropPosition = [(extractPosition select 0) + 60,(extractPosition select 1) + 60,0];
        [_chopSPAWNposNE, _squad, "O_Heli_Light_02_unarmed_F", "O_Pilot_F", _dropUnits, _dropPosition, _enemyFrequency, _minEnemySkill, _maxEnemySkill, _onGroupDropped, drn_var_Escape_debugDropChoppers] spawn A3E_fnc_RoyCreateDropChopper;
	///////////////////////////////////		
