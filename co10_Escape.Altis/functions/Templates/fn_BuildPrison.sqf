private ["_centerPos", "_rotateDir"];
private ["_object", "_pos", "_dir"];

_centerPos = _this select 0;
_rotateDir = _this select 1;

_dir = _rotateDir;

0 = [_centerPos, _dir, call (compile (preprocessFileLineNumbers "Structures\Prison.sqf"))] call BIS_fnc_ObjectsMapper;

/*	
_pos = [(_centerPos select 0) + 10, (_centerPos select 1) + 0, 0];
_triggerpoint = createVehicle ["Sign_Arrow_F", _pos, [], 0, "NONE"];
_triggerpoint setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_triggerpoint setDir _dir;

_marker = createMarker ["Markertest", _pos];
//"markertest" setMarkerPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
"Markertest" setMarkerShape "RECTANGLE";
"Markertest" setMarkerSize [2, 2];
"Markertest" setMarkerColor "ColorRed";

_trigger = createTrigger["EmptyDetector", _pos];
_trigger setTriggerArea[2, 2, 0, true];
_trigger setTriggerActivation["WEST", "NOT PRESENT", true];
_trigger setTriggerStatements["this", "drn_escapeHasStarted = true; hint 'trigger on'", "hint 'trigger off'"];
*/


_marker = createMarker ["drn_PrisonMapMarker", _centerPos];
_marker setMarkerColor "ColorOrange";
_marker setMarkerShape "ICON";
_marker setMarkerType "o_unknown";
_marker setMarkerText "PRISON";


	
if (karts_allowed) then {


_pos = [(_centerPos select 0) + 16, (_centerPos select 1) - 6, 0];
_bike = createVehicle ["C_Kart_01_F", _pos, [], 0, "NONE"];
_bike setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_bike setDir _dir;

_pos = [(_centerPos select 0) + 18, (_centerPos select 1) - 4, 0];
_bike = createVehicle ["C_Kart_01_F", _pos, [], 0, "NONE"];
_bike setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_bike setDir _dir;

_dir = 180 + _rotateDir;

_pos = [(_centerPos select 0) + 18, (_centerPos select 1) + 4, 0];
_bike = createVehicle ["C_Kart_01_F", _pos, [], 0, "NONE"];
_bike setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_bike setDir _dir;

_pos = [(_centerPos select 0) + 16, (_centerPos select 1) + 6, 0];
_bike = createVehicle ["C_Kart_01_F", _pos, [], 0, "NONE"];
_bike setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_bike setDir _dir;

};


