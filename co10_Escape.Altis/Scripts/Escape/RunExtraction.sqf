if (!isServer) exitWith {};

private ["_extractionpos"];
private ["_spawnMarkerName", "_extractionMarkerName", "_extractionMarkerName2", "_result", "_chopper1", "_chopper2", "_group1", "_group2", "_waypoint"];
["The extraction choppers are on their way!"] call drn_fnc_CL_ShowTitleTextAllClients;
_extractionSpawnPos = [];
_markerPos = [];
_extractionSpawnPos = extractPosition;

chopper1Dead = 0;
chopper2Dead = 0;


_markerPosX = _extractionSpawnPos select 0;
_markerPosY = _extractionSpawnPos select 1;

// Extraction surprises
_enemyMinSkill = Param_EnemySkill;
_enemyMaxSkill = _enemyMinskill;
drn_var_Escape_enemyMinSkill = _enemyMinSkill;
drn_var_Escape_enemyMaxSkill = _enemyMaxSkill;

_searchChopperSearchTimeMin = (5 + random 10);
_searchChopperRefuelTimeMin = (5 + random 10);

_enemyFrequency = Param_EnemyFrequency;

_extractionSurpriseChance = [0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,2,2,2,2,2,3,3,3];
_randSurprise = _extractionSurpriseChance select (floor (random(count _extractionSurpriseChance)));


switch (_randSurprise) do {
	case 0: {
		
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_russianChopper;
		sleep 0.3;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_reinforcementTruck;
		sleep 0.3;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_motorSearch;
		sleep 0.5;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_motorSearch;
	};
	case 1: {
	
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_russianChopper;
		sleep 0.3;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_civEnemy;
		sleep 0.5;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_civEnemy;
		sleep 0.5;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_civEnemy;
		sleep 0.5;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_civEnemy;
		sleep 0.5;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_civEnemy;
		sleep 0.5;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_civEnemy;
		sleep 0.5;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_motorSearch;

	};
	case 2: {
	
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_fastMover;
		sleep 0.3;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_stolenA164;
		sleep 0.3;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_motorSearch;
		sleep 0.3;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_reinforcementTruck;
		sleep 0.3;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_reinforcementTruck;
		sleep 0.3;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_reinforcementTruck;
		
	};
	case 3: {	
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_megaDrop;
		sleep 0.3;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_russianChopper;
		sleep 0.3;
		[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency] call A3E_fnc_reinforcementTruck;
		sleep 0.3;
	
	};



};

//// NE Extraction Spawn Point
if (_markerPosX > (A3E_WorldSize / 2)  && _markerPosY  > (A3E_WorldSize / 2)) then

	{
	_markerPos = [(A3E_WorldSize - 200), (A3E_WorldSize - 200),400];
	// "Extraction spawn NE";
	//sleep 3;
	//hintsilent "";
	};

//// NW Extraction Spawn Point
if (_markerPosX < (A3E_WorldSize / 2)  && _markerPosY  > (A3E_WorldSize / 2)) then

	{
	_markerPos = [200, (A3E_WorldSize - 200),400];
	//hintsilent "Extraction spawn NW";
	//sleep 3;
	//hintsilent "";
	};

//// SE Extraction Spawn Point
if (_markerPosX > (A3E_WorldSize / 2)  && _markerPosY  < (A3E_WorldSize / 2)) then

	{
	_markerPos = [(A3E_WorldSize - 200), 200,400];
	//hintsilent "Extraction spawn SE";
	//sleep 3;
	//hintsilent "";
	};

//// SW Extraction Spawn Point
if (_markerPosX < (A3E_WorldSize / 2)  && _markerPosY  < (A3E_WorldSize / 2)) then

	{
	_markerPos = [200, 200, 400];
	//hintsilent "Extraction spawn SW";
	//sleep 3;
	//hintsilent "";
	};
//_spawnMarkerName = "drn_Escape_ExtractionTeamSpawnPos";

sleep 90;

_result = [[(_markerPos select 0) + 25,(_markerPos select 1) + 20, 400], 0, "B_Heli_Transport_01_camo_F", west] call BIS_fnc_spawnVehicle;
chopper1 = _result select 0;
chopper1 setVehicleVarName "chopper1";
_group1 = _result select 2;



_result = [[(_markerPos select 0) - 25, (_markerPos select 1) - 20, 400], 0, "B_Heli_Transport_01_camo_F", west] call BIS_fnc_spawnVehicle;
chopper2 = _result select 0;
chopper2 setVehicleVarName "chopper2";
_group2 = _result select 2;


if (param_weakChoppers == 1) then {

// weak choppers

chopper1 setDamage (random 0.5);
_chpTrg1 = createTrigger ["EmptyDetector", getPos chopper1];
_chpTrg1 triggerAttachVehicle [chopper1];
//_testtrg = triggerAttachedVehicle _chpTrg1;
_chpTrg1 setTriggerStatements ["!(canMove chopper1)", "chopper1 setDamage 1; chopper1Dead = 1", ""];

chopper2 setDamage (random 0.5);
_chpTrg2 = createTrigger ["EmptyDetector", getPos chopper2];
_chpTrg2 triggerAttachVehicle [chopper2];
//_testtrg = triggerAttachedVehicle _chpTrg2;
_chpTrg2 setTriggerStatements ["!(canMove chopper2)", "chopper2 setDamage 1; chopper2Dead = 1", ""];


} else {

// normal choppers

_chpTrg1 = createTrigger ["EmptyDetector", getPos chopper1];
_chpTrg1 triggerAttachVehicle [chopper1];
//_testtrg = triggerAttachedVehicle _chpTrg1;
_chpTrg1 setTriggerStatements ["!(alive chopper1)", "chopper1Dead = 1", ""];

_chpTrg2 = createTrigger ["EmptyDetector", getPos chopper2];
_chpTrg2 triggerAttachVehicle [chopper2];
//_testtrg = triggerAttachedVehicle _chpTrg2;
_chpTrg2 setTriggerStatements ["!(alive chopper2)", "chopper2Dead = 1", ""];


};


// ++++ trigger for alt extraction
_altTrg = createTrigger ["EmptyDetector", [0,0,0]];
//_altTrg triggerAttachVehicle [chopper1];
_altTrg setTriggerStatements ["(chopper1dead == 1 && chopper2dead == 1) || (chopper1dead == 1 || chopper2dead == 1 && ((count (call drn_fnc_Escape_GetPlayers)) > 8))", "[] execVM 'Scripts\Escape\altExtraction.sqf'", ""];

_result = [[(_markerPos select 0) - 40, (_markerPos select 1) - 40, 400], 0, "B_Heli_Attack_01_F", west] call BIS_fnc_spawnVehicle;
chopper3 = _result select 0;
_group3 = _result select 2;

_waypoint = _group1 addWaypoint [(MarkerPos "chopLandMarker1"), 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointFormation "WEDGE";
_waypoint setWaypointType "MOVE"; 
_waypoint setWaypointStatements ["true", "vehicle this land 'LAND'"];

_waypoint = _group2 addWaypoint [(MarkerPos "chopLandMarker2"), 0];
_waypoint setWaypointType "MOVE"; 
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointFormation "WEDGE";
_waypoint setWaypointStatements ["true", "vehicle this land 'LAND'"];

_waypoint = _group3 addWaypoint [(MarkerPos "extractionPosMarker"), 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointFormation "WEDGE";

chopper1 flyinheight A3E_FlyHeight;
chopper2 flyinheight A3E_FlyHeight;
chopper3 flyinheight A3E_FlyHeight;
//_chopper4 flyinheight A3E_FlyHeight;

sleep 1;


// Verkar inte funka...
(driver chopper1) action ["LightOff", chopper1];
(driver chopper2) action ["LightOff", chopper2];

if (isMultiplayer) then {
    waitUntil {{vehicle _x == chopper1 || vehicle _x == chopper2} count (call drn_fnc_Escape_GetPlayers) == count (call drn_fnc_Escape_GetPlayers)};
}
else {
    waitUntil {{vehicle _x == chopper1 || vehicle _x == chopper2} count units group ((call drn_fnc_Escape_GetPlayers) select 0) == count units group ((call drn_fnc_Escape_GetPlayers) select 0)};
};

chopper1 land "NONE";
chopper2 land "NONE";

_waypoint = _group1 addWaypoint [(_markerPos select 0) + 25,(_markerPos select 1) + 20, 400];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";

_waypoint = _group2 addWaypoint [(_markerPos select 0) + 25,(_markerPos select 1) + 20, 400];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";

_waypoint = _group3 addWaypoint _markerPos;
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";


sleep 5;

["Task complete: Rendesvouz with allied forces."] call drn_fnc_CL_ShowTitleTextAllClients;

sleep 35;

["drn_rendesvouzTasks", "SUCCEEDED"] call drn_SetTaskStateOnAllMachines;
drn_var_Escape_MissionComplete = true;
publicVariable "drn_var_Escape_MissionComplete";

