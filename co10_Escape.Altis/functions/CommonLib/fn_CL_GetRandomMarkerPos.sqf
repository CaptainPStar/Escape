/*
 * Summary: Gets a random position inside a marker of shape RECTANGLE or ELLIPSE with any angle.
 * Arguments:
 *   _markerName: Name of marker to get a random position inside.
 * Returns: A position (array) inside current marker. If marker doesn't exist, [0, 0, 0] is returned.
 * History:
 *   Created in CommonLib v1.00.
 *   Updated in CommonLib v1.01 - Function now supports RECTANGLE and ELLIPSE at any angle, previously only RECTANGLEs with angle 0.
 */
 
private ["_markerName"];
private ["_isInside", "_px", "_py", "_mpx", "_mpy", "_msx", "_msy", "_ma", "_rpx", "_rpy", "_i"];

_markerName = _this select 0;

_isInside = false;
_i = 0;
while {!_isInside} do {
_mpx = (getMarkerPos _markerName) select 0;
_mpy = (getMarkerPos _markerName) select 1;
_msx = (getMarkerSize _markerName) select 0;
_msy = (getMarkerSize _markerName) select 1;
_ma = (markerDir _markerName);

_px = _mpx -_msx + random (_msx * 2);
_py = _mpy -_msy + random (_msy * 2);

//Now, rotate point as marker is rotated
_rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
_rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;

if ([[_rpx, _rpy, 0], _markerName] call drn_fnc_CL_PositionIsInsideMarker) then {
	_isInside = true;
};

_i = _i + 1;
if (_i > 1000) exitWith {
	_rpx = 0;
	_rpy = 0;
};
};

[_rpx, _rpy, 0]
