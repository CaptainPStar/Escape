/*
 * Summary: Checks if a position is inside a marker.
 * Remarks: Marker can be of shape "RECTANGLE" or "ELLIPSE" and at any angle.
 * Arguments:
 *   _markerName: Name of current marker.
 *   _pos: Position to test.
 * Returns: true if position is inside marker. Else false.
 * History:
 * Created in CommonLib v1.00
 * Updated in CommonLib v1.01 - Function now supports RECTANGLE and ELLIPSE at any angle, previously only RECTANGLEs with angle 0.
 */
 
 private ["_markerName", "_pos"];
	private ["_isInside", "_px", "_py", "_mpx", "_mpy", "_msx", "_msy", "_ma", "_xmin", "_xmax", "_ymin", "_ymax", "_rpx", "_rpy", "_res"];

	_pos = _this select 0;
	_markerName = _this select 1;

	_px = _pos select 0;
	_py = _pos select 1;
	_mpx = (getMarkerPos _markerName) select 0;
	_mpy = (getMarkerPos _markerName) select 1;
	_msx = (getMarkerSize _markerName) select 0;
	_msy = (getMarkerSize _markerName) select 1;
	_ma = -(markerDir _markerName);

	_xmin = _mpx - _msx;
	_xmax = _mpx + _msx;
	_ymin = _mpy - _msy;
	_ymax = _mpy + _msy;

	//Now, rotate point to investigate around markers center in order to check against a nonrotated marker
	_rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
	_rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;

	_isInside = false;

    if (markerShape _markerName == "RECTANGLE") then {
        if (((_rpx > _xmin) && (_rpx < _xmax)) && ((_rpy > _ymin) && (_rpy < _ymax))) then
        {
            _isInside = true;
        };
    };
    
    if (markerShape _markerName == "ELLIPSE") then {
        _res = (((_rpx-_mpx)^2)/(_msx^2)) + (((_rpy-_mpy)^2)/(_msy^2));
        if ( _res < 1 ) then
        {
            _isInside = true;
        };
    };

	_isInside