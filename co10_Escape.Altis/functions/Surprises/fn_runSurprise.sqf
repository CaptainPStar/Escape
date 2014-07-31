private ["_enemyMinSkill","_enemyMaxSkill","_enemyFrequency","_surprise","_markerPos","_onGroupDropped","_dropUnits","_squad","_dropPosition","_markerPosX","_markerPosY","_chopStartMarker","_searchChopMarker","_searchChopperRefuelTimeMin","_searchChopperSearchTimeMin","_scriptHandle"];

_enemyMinSkill = _this select 0;
_enemyMaxSkill = _this select 1;
_enemyFrequency = _this select 2;
_surprise = _this select 3;

switch (_surprise) do {
    case 0:
    {
        diag_log "Drop Chopper";
		_onGroupDropped = {
		private ["_group", "_dropPos"];
		
		_group = _this select 0;
		_dropPos = _this select 1;
		
		[_group, drn_searchAreaMarkerName, _dropPos, drn_var_Escape_DebugSearchGroup] spawn DRN_fnc_SearchGroup;
	};
	
	_dropUnits = [];
	_squad = "Alpha";
	_dropPosition = [drn_searchAreaMarkerName] call drn_fnc_CL_GetRandomMarkerPos;
		
		// Create Spawn Position
		_markerPos = [0,0,0];
		_markerPosX = (getMarkerPos drn_searchAreaMarkerName select 0);
		_markerPosY = (getMarkerPos drn_searchAreaMarkerName select 1);

		//// NE Search Spawn Point
		if (_markerPosX > (A3E_WorldSize / 2)  && _markerPosY  > (A3E_WorldSize / 2)) then

			{
			_markerPos = [(A3E_WorldSize - 200), (A3E_WorldSize - 200),400];
			//hintsilent "Search spawn NE";
			//sleep 3;
			//hintsilent "";
			};

		//// NW Search Spawn Point
		if (_markerPosX < (A3E_WorldSize / 2)  && _markerPosY  > (A3E_WorldSize / 2)) then

			{
			_markerPos = [200, (A3E_WorldSize - 200),400];
			//hintsilent "Search spawn NW";
			//sleep 3;
			//hintsilent "";
			};

		//// SE Search Spawn Point
		if (_markerPosX > (A3E_WorldSize / 2)  && _markerPosY  < (A3E_WorldSize / 2)) then

			{
			_markerPos = [(A3E_WorldSize - 200), 200,400];
			//hintsilent "Search spawn SE";
			//sleep 3;
			//hintsilent "";
			};

		//// SW Search Spawn Point
		if (_markerPosX < (A3E_WorldSize / 2)  && _markerPosY  < (A3E_WorldSize / 2)) then

			{
			_markerPos = [200, 200, 400];
			//hintsilent "Search spawn SW";
			//sleep 3;
			//hintsilent "";
			};
        [_markerPos, _squad, "O_Heli_Light_02_unarmed_F", "O_Pilot_F", _dropUnits, _dropPosition, _enemyFrequency, _enemyMinSkill, _enemyMaxSkill, _onGroupDropped, drn_var_Escape_debugDropChoppers] spawn A3E_fnc_RoyCreateDropChopper;
		//hintsilent "Drop Chopper";
		// [_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] spawn A3E_fnc_dropChopper;
		//sleep 1;
		//hint "";
    };

    case 1:
    {
        diag_log "Russian Search Chopper";
		//hintsilent "Russian Search Chopper";
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] spawn A3E_fnc_russianChopper;
		//sleep 1;
		//hint "";
    };

	case 2:
    {
        diag_log "Motorized Search Group";
		//hintsilent "Motorized Search Group";		
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] spawn A3E_fnc_motorSearch;
		//sleep 1;
		//hint "";
    };

	case 3:
    {
        diag_log "Civilian Enemy";
		//hintsilent "Civilian Enemy";		
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] spawn A3E_fnc_civEnemy;
		//sleep 1;
		//hint "";
    };

	case 4:
    {
        diag_log "Reinforcement Truck";
		//hintsilent "Reinforcement Truck";		
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] spawn A3E_fnc_reinforcementTruck;
		//sleep 1;
		//hint "";
    };
	
	case 5:
    {
        diag_log "Fast Mover";
		//hintsilent "Fast Mover";		
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] spawn A3E_fnc_fastMover;
		//sleep 1;
		//hint "";
    };
	
	case 6:
    {
        diag_log "Stolen A164";
		//hintsilent "Stolen A164";		
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] spawn A3E_fnc_stolenA164;
		//sleep 1;
		//hint "";
    };
	
	case 7:
    {
        diag_log "Search Chopper";
		_markerPos = [0,0,0];
	_markerPosX = drn_startPos select 0;
	_markerPosY = drn_startPos select 1;

	//// NE Search Spawn Point
	if (_markerPosX > (A3E_WorldSize / 2)  && _markerPosY  > (A3E_WorldSize / 2)) then

		{
		_markerPos = [(A3E_WorldSize - 200), (A3E_WorldSize - 200),400];
		//hintsilent "Search spawn NE";
		//sleep 3;
		//hintsilent "";
		};

	//// NW Search Spawn Point
	if (_markerPosX < (A3E_WorldSize / 2)  && _markerPosY  > (A3E_WorldSize / 2)) then

		{
		_markerPos = [200, (A3E_WorldSize - 200),400];
		//hintsilent "Search spawn NW";
		//sleep 3;
		//hintsilent "";
		};

	//// SE Search Spawn Point
	if (_markerPosX > (A3E_WorldSize / 2)  && _markerPosY  < (A3E_WorldSize / 2)) then

		{
		_markerPos = [(A3E_WorldSize - 200), 200,400];
		//hintsilent "Search spawn SE";
		//sleep 3;
		//hintsilent "";
		};

	//// SW Search Spawn Point
	if (_markerPosX < (A3E_WorldSize / 2)  && _markerPosY  < (A3E_WorldSize / 2)) then

		{
		_markerPos = [200, 200, 400];
		//hintsilent "Search spawn SW";
		//sleep 3;
		//hintsilent "";
		};	
	
	_chopStartMarker = getmarkerPos "drn_searchChopperStartPosMarker";
	diag_log _chopStartMarker;

	
	if ((_chopStartMarker select 0) > 0) then {
	deleteMarker "drn_searchChopperStartPosMarker";
	};
	
	
	_searchChopMarker = createMarker ["drn_searchChopperStartPosMarker", _markerPos];
	_searchChopperRefuelTimeMin = (5 + random 10);
	_searchChopperSearchTimeMin = (5 + random 10);
	
    _scriptHandle = [getMarkerPos "drn_searchChopperStartPosMarker", east, drn_searchAreaMarkerName, _searchChopperSearchTimeMin, _searchChopperRefuelTimeMin, _enemyMinSkill, _enemyMaxSkill, [], drn_var_Escape_debugSearchChopper] execVM "Scripts\Escape\CreateSearchChopper.sqf";
    //waitUntil {scriptDone _scriptHandle};
	//hintsilent "Search Chopper";		
		//[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] spawn A3E_fnc_stolenA164;
	//sleep 3;
	//hint "";
    };
};