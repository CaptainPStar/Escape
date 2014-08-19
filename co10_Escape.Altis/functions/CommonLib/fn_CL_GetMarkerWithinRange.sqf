/*
 * Summary: Gets a random marker that fulfulls specified name expression and is within a specified range from a reference position.
 * Remarks: Markers sought must have name format 'markerPreNameX', where X is an integer value. Marker number must start with
 * 1 and be an unbroken ascending sequence.
 * Arguments:
 *   _markerPreName: Marker name except the ending integer value.
 *   _position: Reference position.
 *   _minDistance: Marker's minimum distance from reference position.
 *   _maxDistance: Marker's maximum distance from reference position.
 * Returns: Name of found marker. Empty string ("") if no marker was found.
 */

private ["_markerPreName", "_markerNo", "_markerName", "_minDistance", "_maxDistance", "_markersWithinRange", "_markersOutsideRange", "_position", "_returnValue"];

_markerPreName = _this select 0;
_position = _this select 1;
_minDistance = _this select 2;
_maxDistance = _this select 3;

_markersWithinRange = [];
_markersOutsideRange = [];
_returnValue = "";

_markerNo = 1;
_markerName = _markerPreName + str _markerNo;

while {[_markerName] call drn_fnc_CL_MarkerExists} do {
	if (_position distance (getMarkerPos _markerName) > _minDistance && _position distance (getMarkerPos _markerName) < _maxDistance) then {
		_markersWithinRange set [count _markersWithinRange, _markerName];
	}
	else {
		if (_position distance (getMarkerPos _markerName) > _minDistance) then {
			_markersOutsideRange set [count _markersOutsideRange, _markerName];
		};
	};

	_markerNo = _markerNo + 1;
	_markerName = _markerPreName + str _markerNo;		
};

if (count _markersWithinRange > 0) then {
	_returnValue = _markersWithinRange select floor (random count _markersWithinRange);
}
else {
	if (count _markersOutsideRange > 0) then {
		_returnValue = _markersOutsideRange select floor (random count _markersOutsideRange);
	};
};

_returnValue