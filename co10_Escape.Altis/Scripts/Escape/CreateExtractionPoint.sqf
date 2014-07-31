if (!isServer) exitWith {};

private ["_markerPos", "_markerName", "_trigger"];
extractPosition = 0;
_markerPos = _this select 0;
//_markerName = "drn_Escape_ExtractionPos" + str _markerNo;
extractPosition = _markerPos;

_trigger = createTrigger["EmptyDetector", _markerPos];
_trigger triggerAttachVehicle [(call drn_fnc_Escape_GetPlayers) select 0];
_trigger setTriggerArea[30, 30, 0, false];
_trigger setTriggerActivation["MEMBER", "PRESENT", false];
_trigger setTriggerStatements["this", "_nil = [_markerPos] execVM ""Scripts\Escape\RunExtraction.sqf"";", ""];


	
	
//drn_var_Escape_ExtractionMarkerNo = _markerNo;
//publicVariable "drn_var_Escape_ExtractionMarkerNo";
