if (!isServer) exitWith {};


private ["_markerPos","_veh","_squad1","_extractionSpawnPos","_markerPosX","_markerPosY","_halfWorld","_isWater","_squad1Pos","_squad2Pos","_attached","_trigger"];


_extractionSpawnPos = [];
_markerPos = [];
_extractionSpawnPos = extractPosition;
//diag_log _extractionSpawnPos;
//"extractionPosMarker" setMarkerPos [extractionpos];

_markerPosX = _extractionSpawnPos select 0;
_markerPosY = _extractionSpawnPos select 1;
_halfWorld = 0;
_halfWorld = A3E_WorldSize / 2;

//// NE Extraction Spawn Point
if (_markerPosX > _halfWorld  && _markerPosY  > _halfWorld) then

	{
	_markerPos = [50 + random(2500), 50 + random(2500), 0];
	//hintSilent "Extraction spawn NE";
	//sleep 3;
	//hintsilent "";
	};
	

//// NW Extraction Spawn Point
if (_markerPosX < _halfWorld  && _markerPosY  > _halfWorld) then

	{
	_markerPos = [A3E_WorldSize - random(2500), 50 + random(2500), 0];
	//hintsilent "Extraction spawn NW";
	//sleep 3;
	//hintsilent "";
	};

//// SE Extraction Spawn Point
if (_markerPosX > _halfWorld  && _markerPosY  < _halfWorld) then

	{
	_markerPos = [50 + random(2500), A3E_WorldSize - random(2500), 0];
	//hintsilent "Extraction spawn SE";
	//sleep 3;
	//hintsilent "";
	};

//// SW Extraction Spawn Point
if (_markerPosX < _halfWorld  && _markerPosY  < _halfWorld) then

	{
	_markerPos = [A3E_WorldSize - random(2500), A3E_WorldSize - random(2500), 0];
	//hintsilent "Extraction spawn SW";
	//sleep 3;
	//hintsilent "";
	};

drn_var_Escape_ExtractionMarkerPos = _markerPos;	
//drn_var_Escape_ExtractionMarker = createMarker ["drn_visibleGoalMarker", drn_var_Escape_ExtractionMarkerPos];
"drn_visibleGoalMarker" setMarkerPos drn_var_Escape_ExtractionMarkerPos;
drn_var_Escape_ExtractionMarker setMarkerType "Flag_NATO";

["The extraction team are MIA. A new Rendezvous point is marked on the map."] call drn_fnc_CL_ShowTitleTextAllClients;

markerSurface = "";	
_isWater = false;
_isWater = surfaceIsWater _markerPos;

	if (_isWater) then 
		{		
		markerSurface = "water";		
		}
		else
		{
		markerSurface = "land";
		};






switch (markerSurface) do
{
	case "land":
	{
	_squad1Pos = [(_markerPos select 0) -15, _markerPos select 1, _markerPos select 2];
	_squad2Pos = [(_markerPos select 0) +15, _markerPos select 1, _markerPos select 2];
	
	_veh = objNull;
	_veh = createVehicle ["B_Truck_01_medical_F", _markerPos, [], 0, "NONE"];
	_squad1 = [_squad1Pos, WEST, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Armored" >> "BUS_TankPlatoon_AA"),[],[],[],[],[3,1],180] call BIS_fnc_spawnGroup; 
	_squad1 = [_squad2Pos, WEST, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Mechanized" >> "BUS_MechInf_Support"),[],[],[],[],[3,1],90] call BIS_fnc_spawnGroup;		
	};
	
	case "water":
	{
	_boat5Pos = [(_markerPos select 0),(_markerPos select 1) -15,(_markerPos select 2)];
	_boat1Pos = [(_markerPos select 0) + 6,(_markerPos select 1) -18,(_markerPos select 2)];
	_boat2Pos = [(_markerPos select 0) - 6,(_markerPos select 1) -18,(_markerPos select 2)];
	_boat3Pos = [(_markerPos select 0) + 4,(_markerPos select 1) -26,(_markerPos select 2)];
	_boat4Pos = [(_markerPos select 0) - 4,(_markerPos select 1) -26,(_markerPos select 2)];

	_boat = [_boat1Pos, 316, "B_Boat_Transport_01_F", west] call BIS_fnc_spawnVehicle;
	_boat = [_boat2Pos, 22, "B_Boat_Transport_01_F", west] call BIS_fnc_spawnVehicle;
	_boat = [_boat3Pos, 336, "B_Boat_Transport_01_F", west] call BIS_fnc_spawnVehicle;
	_boat = [_boat4Pos, 8, "B_Boat_Transport_01_F", west] call BIS_fnc_spawnVehicle;
	_boat = [_boat5Pos, 0, "B_Boat_Armed_01_minigun_F", west] call BIS_fnc_spawnVehicle;
	};
};
_attached = "";
_trigger = createTrigger["EmptyDetector", _markerPos];
_trigger triggerAttachVehicle [(call drn_fnc_Escape_GetPlayers) select 0];
_attached = ((call drn_fnc_Escape_GetPlayers) select 0);

_trigger setTriggerArea[30, 30, 0, false];
_trigger setTriggerActivation["MEMBER", "PRESENT", false];
_trigger setTriggerStatements["this", "_nil = [drn_var_Escape_ExtractionMarkerPos, markerSurface] execVM ""Scripts\Escape\RunAltExtraction.sqf"";", ""];


