//waituntil{!isNil("BIS_fnc_init")};
if(!isServer) exitwith {};
["Server started."] spawn a3e_fnc_debugChat;


//if(isNil("drn_var_commonLibInitialized")) then {
call compile preprocessFileLineNumbers "Scripts\DRN\CommonLib\CommonLib.sqf";
//};

waitUntil {!isnil ("drn_var_commonLibInitialized")};


//Parse the parameters
call a3e_fnc_parameterInit;

// Add crashsite here
//##############


private ["_useEscapeSurprises", "_useRandomStartPos", "_useAmmoDepots", "_useSearchLeader", "_useMotorizedSearchGroup", "_useVillagePatrols", "_useMilitaryTraffic", "_useAmbientInfantry", "_useSearchChopper", "_useRoadBlocks", "_guardsExist", "_guardsAreArmed", "_guardLivesLong"];
private ["_debugEscapeSurprises", "_debugAmmoDepots", "_debugSearchLeader", "_showGroupDiagnostics", "_debugVillagePatrols", "_debugMilitaryTraffic", "_debugAmbientInfantry", "_debugGarbageCollector", "_debugRoadBlocks"];
private ["_EnemyCount","_debugAllUnits","_pos","_enemyMinSkill", "_enemyMaxSkill", "_searchChopperSearchTimeMin", "_searchChopperRefuelTimeMin", "_enemySpawnDistance", "_playerGroup", "_enemyFrequency", "_comCenGuardsExist", "_fenceRotateDir", "_scriptHandle"];

// Developer Variables
EAST Setfriend [RESISTANCE, 1];
RESISTANCE setFriend [EAST, 1];

WEST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [WEST, 0];

if((Param_NoNightvision)==1) then {
	a3e_var_noNV = true;
} else {
	a3e_var_noNV = false;
};

//[] spawn MB_fnc_randomWeather2;
private["_weather","_weatherTrend"];
_weather = ["clear","sunny","cloudy","foggy","bad","random"] select Param_Weather;
_weatherTrend = ["constant","worse","pWorse","better","pBetter","freeCycle","random"] select Param_WeatherTrend;

0 = [_weather, _weatherTrend, 0, [0, 0.2], 0, [0, 1, 0, 0.4, 0, 1]] execVM "Scripts\tort\tort_DynamicWeather.sqf";

private ["_hour","_date"];
_hour = Param_TimeOfDay;
_date = date;
if(_hour==24) then {
	_hour = round(random(24));
};
_date set [3,_hour];
[_date] call bis_fnc_setDate;

setTimeMultiplier Param_TimeMultiplier;

//call compile preprocessFileLineNumbers ("Islands\" + worldName + "\CommunicationCenterMarkers.sqf");

// Roy Stuff
drn_arr_communicationCenterMarkers = [];

royCars_allowed = false;
mechs_allowed = false;
karts_allowed = false;
RDSCars_allowed = false;

if (Param_RoyCars == 1) then {
           royCars_allowed = true;
        };

if (Param_RDSCars == 1) then {
           RDSCars_allowed = true;
        };
		
if (Param_Mech == 1) then {
           mechs_allowed = true;
        };

if (Param_Kart == 1) then {
           karts_allowed = true;
        };
		
// Create Markers
_center = createCenter sideLogic;
_groupLog = createGroup _center;
SWpos = [];
NEpos = [];
_LogPos = [0,0,0];
_LogPos2 = [A3E_WorldSize,A3E_WorldSize,0];
_logPosC = [(A3E_WorldSize/2),(A3E_WorldSize/2),0];
center = _groupLog createUnit ["LOGIC", _LogPosC , [], 0, ""];
SouthWest = _groupLog createUnit ["LOGIC", _LogPos , [], 0, ""];
NorthEast = _groupLog createUnit ["LOGIC", _LogPos2, [], 0, ""];
SWpos = getPos SouthWest;
NEpos = getPos NorthEast;
publicVariable "SWpos";
publicVariable "NEpos";
_mapSize = A3E_WorldSize - 50;
_LogPosSW = [150,150,0];
_LogPosSE = [_mapSize,150,0];
_LogPosNW = [150,_mapSize,0];
_LogPosNE = [_mapSize,_mapSize,0];

_TrafMarkSW = createMarker ["TrafficMarker_SouthWest", _LogPosSW];


_TrafMarkSE = createMarker ["TrafficMarker_SouthEast", _LogPosSE];


_TrafMarkNW = createMarker ["TrafficMarker_NorthWest", _LogPosNW];


_TrafMarkNE = createMarker ["TrafficMarker_NorthEast", _LogPosNE];


_russianChop_pos = [200,200,500];
_rusChopSPWN = createMarker ["russian_spwn", _russianChop_pos];

_A164_pos = [A3E_WorldSize - 200,A3E_WorldSize -200,500];
_A164SPWN = createMarker ["A164_spwn", _A164_pos];

_fastMover_pos = [200,A3E_WorldSize - 200,500];
_fastMoverSPWN = createMarker ["fastMover_spwn", _fastMover_pos];

_mapCentre = [(A3E_WorldSize/2),(A3E_WorldSize/2),0];

//#### Do we need all those switches
_useRandomStartPos = true;
_useEscapeSurprises = true;
_useAmmoDepots = true;
_useSearchLeader = true;
_useMotorizedSearchGroup = true;
_useVillagePatrols = false;
_useMilitaryTraffic = true;
_useAmbientInfantry = true;
_useSearchChopper = true;
_useRoadBlocks = true;

_guardsExist = true;
_comCenGuardsExist = true;
_guardsAreArmed = true;
_guardLivesLong = true;

// Debug Variables

_debugAllUnits = false;
_debugEscapeSurprises = false;
_debugAmmoDepots = false;
_debugSearchLeader = false;
_debugVillagePatrols = false;
_debugMilitaryTraffic = true;
_debugAmbientInfantry = true;
_debugGarbageCollector = false;
_debugRoadBlocks = true;
drn_var_Escape_debugMotorizedSearchGroup = false;
drn_var_Escape_debugDropChoppers = false;
drn_var_Escape_debugReinforcementTruck = false;
drn_var_Escape_debugSearchChopper = false;
drn_var_Escape_DebugSearchGroup = false;
drn_var_Escape_debugCivilEnemy = false;

_showGroupDiagnostics = false;

// Game Control Variables, do not edit!

drn_var_Escape_AllPlayersDead = false;
drn_var_Escape_MissionComplete = false;
publicVariable "drn_var_Escape_AllPlayersDead";
publicVariable "drn_var_Escape_MissionComplete";

a3e_var_GrpNumber = 0;

_enemyMinSkill = Param_EnemySkill;
_enemyMaxSkill = _enemyMinskill;
drn_var_Escape_enemyMinSkill = _enemyMinSkill;
drn_var_Escape_enemyMaxSkill = _enemyMaxSkill;

_searchChopperSearchTimeMin = (5 + random 10);
_searchChopperRefuelTimeMin = (5 + random 10);

_enemyFrequency = Param_EnemyFrequency;
_enemySpawnDistance = Param_EnemySpawnDistance;
_villagePatrolSpawnArea = 0;

drn_searchAreaMarkerName = "drn_searchAreaMarker";
_gradient = Param_BuildingGradient;
_result = [];
_finalResult = 0;
// Choose a start position

waitUntil {	
	//diag_log "waiting for _result";
	_startPos = [(SWpos select 0) + random (NEpos select 0) + 20,(SWpos select 1) + random (NEpos select 1) + 20, 0];
	_result = _startPos isFlatEmpty [5, 0, 0.15, 30, 0, false, objNull];
	
	switch ((count _result) > 0) do {
		case true: {			
			_nearRoads = _result nearRoads 120;
			if ((count _nearRoads) == 0) then {_finalResult = 1;};
			};
		case false: {};
		};
	(_finalResult > 0)
	};
	
drn_startPos = [_result select 0, _result select 1, 0];
_dir = random 360;
publicVariable "drn_startPos";

A3E_var_BannedPositions = [drn_startPos];

// Build start position
_fenceRotateDir = random 360;
_scriptHandle = [drn_startPos, _fenceRotateDir] spawn a3e_fnc_BuildPrison;
waitUntil {scriptDone _scriptHandle};

drn_fenceIsCreated = true;
publicVariable "drn_fenceIsCreated";

//### The following is a mission function now

//[true] call drn_fnc_InitVillageMarkers; 
//[true] call drn_fnc_InitAquaticPatrolMarkers; 

[_enemyFrequency] call compile preprocessFileLineNumbers "Scripts\Escape\UnitClasses.sqf";


waitUntil {!isnil {call drn_fnc_Escape_GetPlayers}};
//#### The player group should become a global variable broadcasted to network ###
_playerGroup = group ((call drn_fnc_Escape_GetPlayers) select 0);

if (_useEscapeSurprises) then {
    [_enemyMinSkill, _enemyMaxSkill, _enemyFrequency, _debugEscapeSurprises] execVM "Scripts\Escape\EscapeRoySurprises.sqf";
};

if (_showGroupDiagnostics) then {
    [] spawn drn_fnc_MonitorEmptyGroups;
};

//_EnemyCount = [3] call A3E_fnc_GetEnemyCount;
//_minEnemies = _EnemyCount select 0;
//_maxEnemies = _EnemyCount select 1;


// Create all the installations
[_playergroup, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance] call A3E_fnc_createPOIs;

diag_log "created POIs";


// Initialize search leader
if (_useSearchLeader) then {
    [drn_searchAreaMarkerName, _debugSearchLeader] execVM "Scripts\Escape\SearchLeader.sqf";
};

diag_log "created searchleader";

// Create motorized search group
if (_useMotorizedSearchGroup) then {
    [_enemyFrequency, _enemyMinSkill, _enemyMaxSkill] spawn {
        private ["_enemyFrequency", "_enemyMinSkill", "_enemyMaxSkill"];
        private ["_spawnSegment"];
        
        _enemyFrequency = _this select 0;
        _enemyMinSkill = _this select 1;
        _enemyMaxSkill = _this select 2;
        
        _spawnSegment = [(call drn_fnc_Escape_GetPlayerGroup), 1500, 2000] call drn_fnc_Escape_FindSpawnSegment;
        while {(str _spawnSegment) == """NULL"""} do {
            _spawnSegment = [(call drn_fnc_Escape_GetPlayerGroup), 1500, 2000] call drn_fnc_Escape_FindSpawnSegment;
            sleep 1;
        };
        
        [getPos _spawnSegment, drn_searchAreaMarkerName, _enemyFrequency, _enemyMinSkill, _enemyMaxSkill, drn_var_Escape_debugMotorizedSearchGroup] execVM "Scripts\Escape\CreateMotorizedSearchGroup.sqf";
    };
};

diag_log "after motorized search group"; 

// Start garbage collector
[_playerGroup, 750, _debugGarbageCollector] spawn drn_fnc_CL_RunGarbageCollector;

if(_debugAllUnits) then {
		[] spawn A3E_fnc_unit_debug_marker;
	};

diag_log "after Starting garbage collector"; 
// Run initialization for scripts that need the players to be gathered at the start position
[_useVillagePatrols, _useMilitaryTraffic, _useAmbientInfantry, _debugVillagePatrols, _debugMilitaryTraffic, _debugAmbientInfantry, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _enemyFrequency, _useRoadBlocks, _debugRoadBlocks, _villagePatrolSpawnArea] spawn {
    private ["_useVillagePatrols", "_useMilitaryTraffic", "_useAmbientInfantry", "_debugVillagePatrols", "_debugMilitaryTraffic", "_debugAmbientInfantry", "_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_enemyFrequency", "_useRoadBlocks", "_debugRoadBlocks"];
    private ["_fnc_OnSpawnAmbientInfantryGroup", "_fnc_OnSpawnAmbientInfantryUnit", "_scriptHandle"];
    private ["_playerGroup", "_minEnemiesPerGroup", "_maxEnemiesPerGroup", "_fnc_OnSpawnGroup"];
    
    _useVillagePatrols = _this select 0;
    _useMilitaryTraffic = _this select 1;
    _useAmbientInfantry = _this select 2;
    _debugVillagePatrols = _this select 3;
    _debugMilitaryTraffic = _this select 4;
    _debugAmbientInfantry = _this select 5;
    _enemyMinSkill = _this select 6;
    _enemyMaxSkill = _this select 7;
    _enemySpawnDistance = _this select 8;
    _enemyFrequency = _this select 9;
    _useRoadBlocks = _this select 10;
    _debugRoadBlocks = _this select 11;
	_villagePatrolSpawnArea = _this select 12;

    waitUntil {[drn_startPos] call drn_fnc_Escape_AllPlayersOnStartPos};
    _playerGroup = group ((call drn_fnc_Escape_GetPlayers) select 0);

	
    if (_useVillagePatrols) then {
        switch (_enemyFrequency) do
        {
            case 1: // 1-2 players
            {
                _minEnemiesPerGroup = 2;
                _maxEnemiesPerGroup = 4;
            };
            case 2: // 3-5 players
            {
                _minEnemiesPerGroup = 3;
                _maxEnemiesPerGroup = 6;
            };
            default // 6-8 players
            {
                _minEnemiesPerGroup = 4;
                _maxEnemiesPerGroup = 8;
            };
        };
        
        _fnc_OnSpawnGroup = {
            {
                _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
            } foreach units _this;
        };
        
        //_scriptHandle = [(units _playerGroup) select 0, east, drn_arr_Escape_InfantryTypes, _minEnemiesPerGroup, _maxEnemiesPerGroup, _villagePatrolSpawnArea, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance + 250, _fnc_OnSpawnGroup, _debugVillagePatrols] spawn drn_fnc_InitVillagePatrols;
        _scriptHandle = [_playerGroup, "drn_villageMarker", east, "INS", 5, _minEnemiesPerGroup, _maxEnemiesPerGroup, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _villagePatrolSpawnArea, _debugVillagePatrols] spawn drn_fnc_InitVillagePatrols;
        waitUntil {scriptDone _scriptHandle};
    };
	
diag_log "after motorized search group";

    if (_useVillagePatrols) then {
        switch (_enemyFrequency) do
        {
            case 1: // 1-2 players
            {
                _minEnemiesPerGroup = 2;
                _maxEnemiesPerGroup = 4;
            };
            case 2: // 3-5 players
            {
                _minEnemiesPerGroup = 3;
                _maxEnemiesPerGroup = 6;
            };
            default // 6-8 players
            {
                _minEnemiesPerGroup = 4;
                _maxEnemiesPerGroup = 8;
            };
        };
        
        _fnc_OnSpawnGroup = {
            {
                _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
            } foreach units _this;
        };
        
        _scriptHandle = [(units _playerGroup) select 0, east, drn_arr_Escape_InfantryTypes, _minEnemiesPerGroup, _maxEnemiesPerGroup, 500000, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance + 250, _fnc_OnSpawnGroup, _debugVillagePatrols] spawn drn_fnc_InitAquaticPatrols;
        waitUntil {scriptDone _scriptHandle};
    };
    
diag_log "after village patrols";   

    // Initialize ambient infantry groups
    if (_useAmbientInfantry) then {
        
        _fnc_OnSpawnAmbientInfantryUnit = {
            _this call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
        };
        
        _fnc_OnSpawnAmbientInfantryGroup = {
            private ["_unit", "_enemyUnit", "_i"];
            private ["_scriptHandle"];
            
            _unit = units _this select 0;
            
            while {!(isNull _unit)} do {
                _enemyUnit = _unit findNearestEnemy (getPos _unit);
                if (!(isNull _enemyUnit)) exitWith {
                    
                    for [{_i = (count waypoints _this) - 1}, {_i >= 0}, {_i = _i - 1}] do {
                        deleteWaypoint [_this, _i];
                    };
                    
                    _scriptHandle = [_this, drn_searchAreaMarkerName, (getPos _enemyUnit), drn_var_Escape_DebugSearchGroup] spawn drn_fnc_searchGroup;
                    _this setVariable ["drn_scriptHandle", _scriptHandle];
                };
                
                sleep 5;
            };
        };
        
        private ["_infantryTypes"];
        private ["_infantryGroupsCount", "_radius", "_groupsPerSqkm"];

        switch (_enemyFrequency) do
        {
            case 1: // 1-2 players
            {
                _minEnemiesPerGroup = 2;
                _maxEnemiesPerGroup = 4;
                _groupsPerSqkm = 1;
            };
            case 2: // 3-5 players
            {
                _minEnemiesPerGroup = 2;
                _maxEnemiesPerGroup = 8;
                _groupsPerSqkm = 1.2;
            };
            default // 6-8 players
            {
                _minEnemiesPerGroup = 2;
                _maxEnemiesPerGroup = 12;
                _groupsPerSqkm = 1.4;
            };
        };

        _radius = (_enemySpawnDistance + 500) / 1000;
        _infantryGroupsCount = round (_groupsPerSqkm * _radius * _radius * 3.141592);
        
        [_playerGroup, east, drn_arr_Escape_InfantryTypes, _infantryGroupsCount, _enemySpawnDistance + 200, _enemySpawnDistance + 500, _minEnemiesPerGroup, _maxEnemiesPerGroup, _enemyMinSkill, _enemyMaxSkill, 750, _fnc_OnSpawnAmbientInfantryUnit, _fnc_OnSpawnAmbientInfantryGroup, _debugAmbientInfantry] spawn drn_fnc_AmbientInfantry;
        sleep 0.25;
    };
   
	// Random Boats
	[] call A3E_fnc_randomBoats;
	
diag_log "after call A3E_fnc_randomBoats";	
    // Initialize the Escape military and civilian traffic
    if (_useMilitaryTraffic) then {
        private ["_vehiclesPerSqkm", "_radius", "_vehiclesCount", "_fnc_onSpawnCivilian", "_vehicleClasses"];
        
        // Civilian traffic
        
        switch (_enemyFrequency) do
        {
            case 1: // 1-3 players
            {
                _vehiclesPerSqkm = 1.6;
            };
            case 2: // 4-6 players
            {
                _vehiclesPerSqkm = 1.4;
            };
            default // 7-8 players
            {
                _vehiclesPerSqkm = 1.2;
            };
        };
        
        _radius = _enemySpawnDistance + 500;
        _vehiclesCount = round (_vehiclesPerSqkm * (_radius / 1000) * (_radius / 1000) * 3.141592);
        
        _fnc_onSpawnCivilian = {
            private ["_vehicle", "_crew"];
            _vehicle = _this select 0;
            _crew = _this select 1;
            //_vehiclesGroup = _result select 2;
            
            {
                {
                    _x removeWeapon "ItemMap";
                } foreach _crew; // foreach crew
                
                _x addeventhandler ["killed",{
                    if ((_this select 1) in (call drn_fnc_Escape_GetPlayers)) then {
                        drn_var_Escape_SearchLeader_civilianReporting = true;
                        publicVariable "drn_var_Escape_SearchLeader_civilianReporting";
                        (_this select 1) addScore -4;
                        [name (_this select 1) + " has killed a civilian."] call drn_fnc_CL_ShowCommandTextAllClients;
                    }
                }];
            } foreach _crew;
            
            if (random 100 < 20) then {
                private ["_index", "_weaponItem"];
                
                _index = floor random count drn_arr_CivilianCarWeapons;
                _weaponItem = drn_arr_CivilianCarWeapons select _index;
                
                _vehicle addWeaponCargoGlobal [_weaponItem select 0, 1];
                _vehicle addMagazineCargoGlobal [_weaponItem select 1, _weaponItem select 2];
            };
        };
        
        [_playerGroup, civilian, drn_arr_Escape_MilitaryTraffic_CivilianVehicleClasses, _vehiclesCount, _enemySpawnDistance, _radius, 0.5, 0.5, _fnc_onSpawnCivilian, _debugMilitaryTraffic] spawn drn_fnc_MilitaryTraffic;
        sleep 0.25;
        
        // Enemy military traffic
        
        switch (_enemyFrequency) do
        {
            case 1: // 1-3 players
            {
                _vehiclesPerSqkm = 0.6;
            };
            case 2: // 4-6 players
            {
                _vehiclesPerSqkm = 0.8;
            };
            default // 7-8 players
            {
                _vehiclesPerSqkm = 1;
            };
        };
        
        _radius = _enemySpawnDistance + 500;
        _vehiclesCount = round (_vehiclesPerSqkm * (_radius / 1000) * (_radius / 1000) * 3.141592);
        [_playerGroup, east, drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses, _vehiclesCount, _enemySpawnDistance, _radius, _enemyMinSkill, _enemyMaxSkill, drn_fnc_Escape_TrafficSearch, _debugMilitaryTraffic] spawn drn_fnc_MilitaryTraffic;
        sleep 0.25;
    };
diag_log "after military traffic";   
    if (_useRoadBlocks) then {
        private ["_areaPerRoadBlock", "_maxEnemySpawnDistanceKm", "_roadBlockCount"];
        private ["_fnc_OnSpawnInfantryGroup", "_fnc_OnSpawnMannedVehicle"];
        
        _fnc_OnSpawnInfantryGroup = {{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach units _this;};
        _fnc_OnSpawnMannedVehicle = {{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach (_this select 1);};
        
        switch (_enemyFrequency) do {
            case 1: {
                _areaPerRoadBlock = 4.19;
            };
            case 2: {
                _areaPerRoadBlock = 3.14;
            };
            default {
                _areaPerRoadBlock = 2.5;
            };
        };
        
        _maxEnemySpawnDistanceKm = (_enemySpawnDistance + 500) / 1000;
        _roadBlockCount = round ((_maxEnemySpawnDistanceKm * _maxEnemySpawnDistanceKm * 3.141592) / _areaPerRoadBlock);
        
        if (_roadBlockCount < 1) then {
            _roadBlockCount = 1;
        };
        
        [_playerGroup, east, drn_arr_Escape_InfantryTypes, drn_arr_Escape_RoadBlock_MannedVehicleTypes, _roadBlockCount, _enemySpawnDistance, _enemySpawnDistance + 500, 750, 300, _fnc_OnSpawnInfantryGroup, _fnc_OnSpawnMannedVehicle, _debugRoadBlocks] spawn drn_fnc_RoadBlocks;
        sleep 0.25;
    };
};

// Create search chopper
if (_useSearchChopper) then {
    private ["_scriptHandle"];
    _scriptHandle = [getMarkerPos "drn_searchChopperStartPosMarker", east, drn_searchAreaMarkerName, _searchChopperSearchTimeMin, _searchChopperRefuelTimeMin, _enemyMinSkill, _enemyMaxSkill, [], drn_var_Escape_debugSearchChopper] execVM "Scripts\Escape\CreateSearchChopper.sqf";
    waitUntil {scriptDone _scriptHandle};
};

// Roy stuff - ups markers
_xPos = 0;
infNo = 0;
infArray = [];
_players = (switchableUnits + playableUnits);

{
	_playr = _x;
	_xPos = getPos _x;
	_marker = createMarker [str _x + "midvillage", _xPos];
	_marker setMarkerShape "Rectangle";
	_marker setMarkerAlpha 0;
	_marker setMarkerSize [200,200];

} forEach _players;

0 = [] execVM "Scripts\Escape\villagePatrolsUPS.sqf";

// Spawn creation of start position settings
[drn_startPos, _enemyMinSkill, _enemyMaxSkill, _guardsAreArmed, _guardsExist, _guardLivesLong, _enemyFrequency, _fenceRotateDir] spawn {
    private ["_startPos", "_enemyMinSkill", "_enemyMaxSkill", "_guardsAreArmed", "_guardsExist", "_guardLivesLong", "_enemyFrequency", "_fenceRotateDir"];
    private ["_backpack","_debugAllUnits","_i", "_guard", "_guardGroup", "_marker", "_guardCount", "_guardGroups", "_unit", "_createNewGroup", "_guardPos"];
    
    _startPos = _this select 0;
    _enemyMinSkill = _this select 1;
    _enemyMaxSkill = _this select 2;
    _guardsAreArmed = _this select 3;
    _guardsExist = _this select 4;
    _guardLivesLong = _this select 5;
    _enemyFrequency = _this select 6;
    _fenceRotateDir = _this select 7;
	 
    // Spawn guard

    _guardPos = [_startPos, [(_startPos select 0) - 4, (_startPos select 1) + 4, 0], _fenceRotateDir] call drn_fnc_CL_RotatePosition;
	
	_backpack = "B_AssaultPack_khk" createvehicle _startPos;

	for [{_i = 0}, {_i < 5}, {_i = _i + 1}] do {
		_weapon = drn_var_Escape_InnerFenceGuardSecondaryWeapon select floor(random(count(drn_var_Escape_InnerFenceGuardSecondaryWeapon)));
		_backpack addWeaponCargoGlobal[(_weapon select 0),1];
		_backpack addMagazineCargoGlobal[(_weapon select 1),3];
	};
	
    // Spawn more guards
    _marker = createMarkerLocal ["drn_guardAreaMarker", _startPos];
    _marker setMarkerAlpha 0;
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerSizeLocal [50, 50];
    
    if (_guardsExist) then {
        _guardCount = (2 + (_enemyFrequency)) + floor (random 2);
    }
    else {
        _guardCount = 0;
    };
    _guardGroups = [];
    _createNewGroup = true;
    
    for [{_i = 0}, {_i < _guardCount}, {_i = _i + 1}] do {
        private ["_pos"];
        
        _pos = [_marker] call drn_fnc_CL_GetRandomMarkerPos;
        while {_pos distance _startPos < 10} do {
            _pos = [_marker] call drn_fnc_CL_GetRandomMarkerPos;
        };
        
        if (_createNewGroup) then {
            _guardGroup = createGroup RESISTANCE;
            _guardGroups set [count _guardGroups, _guardGroup];
            _createNewGroup = false;
        };
        
        //(drn_arr_Escape_StartPositionGuardTypes select floor (random count drn_arr_Escape_StartPositionGuardTypes)) createUnit [_pos, _guardGroup, "", (0.5), "CAPTAIN"];
        _guardGroup createUnit [(drn_arr_Escape_StartPositionGuardTypes select floor (random count drn_arr_Escape_StartPositionGuardTypes)), _pos, [], 0, "FORM"];
        
        if (count units _guardGroup >= 2) then {
            _createNewGroup = true;
        };
    };
    
    {
        _guardGroup = _x;
        
        _guardGroup setFormDir floor (random 360);
        
        {
            _unit = _x; //(units _guardGroup) select 0;
            _unit setUnitRank "CAPTAIN";
			_unit unlinkItem "ItemMap";
            _unit unlinkItem "ItemCompass";
            _unit unlinkItem "ItemGPS";
			_unit unlinkItem "NVGoggles_INDEP";
			
			if(random 100 < 80) then {
				removeAllPrimaryWeaponItems _unit;
				
			};
            if ((random 100 < 20) && (!a3e_var_noNV)) then {
                _unit linkItem "NVGoggles_INDEP";
            };
            //_unit call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
            //_unit setSkill drn_var_Escape_enemyMinSkill;
			[_unit, drn_var_Escape_enemyMinSkill] call EGG_EVO_skill;
            _unit removeMagazines "Handgrenade";
            
            if (_guardsAreArmed) then {
                _unit setVehicleAmmo 0.3 + random 0.7;
            }
            else {
                removeAllWeapons _unit;
            };
        } foreach units _guardGroup;
        
        [_guardGroup, _marker] spawn drn_fnc_SearchGroup;
        
    } foreach _guardGroups;
    
    sleep 0.5;
    
    drn_startPos = _startPos;
    publicVariable "drn_startPos";
    
    // Start thread that waits for escape to start
    [_guardGroups, _startPos] spawn {
        private ["_guardGroups", "_startPos"];
        
        _guardGroups = _this select 0;
        _startPos = _this select 1;
        
        sleep 5;
        
        while {isNil "drn_escapeHasStarted"} do {
            // If any member of the group is to far away from fence, then escape has started
            {
				_x setCaptive true; //Maybe setcaptive is broken
                if (!(_x getVariable ["drn_var_initializing", true])) then {
                    if ((_x distance _startPos) > 25 && (_x distance _startPos) < 100) exitWith {
                        drn_escapeHasStarted = true;
                        publicVariable "drn_escapeHasStarted";
                    };
                };
				// If any player have picked up a weapon, escape has started
                if (!(_x getVariable ["drn_var_initializing", true])) then {
                    if (count weapons _x > 0) exitWith {
                        drn_escapeHasStarted = true;
                        publicVariable "drn_escapeHasStarted";
                    };
                };
            } foreach call drn_fnc_Escape_GetPlayers;
            
            sleep 1;
        };
        
        // ESCAPE HAS STARTED
        
        {
            _x setCaptive false;
        } foreach call drn_fnc_Escape_GetPlayers;
        
        sleep (15 + random 15);
        
        {
            private ["_guardGroup"];
            
            _guardGroup = _x;
            
            {
                _guardGroup reveal _x;
            } foreach call drn_fnc_Escape_GetPlayers;
        } foreach _guardGroups;
    };
};
