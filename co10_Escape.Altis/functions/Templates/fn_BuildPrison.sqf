private ["_centerPos", "_rotateDir"];
private ["_object", "_pos", "_dir"];

_centerPos = _this select 0;
_rotateDir = _this select 1;

_dir = _rotateDir;

0 = [_centerPos, _dir, call (compile (preprocessFileLineNumbers "Structures\Prison.sqf"))] call BIS_fnc_ObjectsMapper;

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
