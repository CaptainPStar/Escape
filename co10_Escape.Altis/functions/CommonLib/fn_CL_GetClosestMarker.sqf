/*
 * Summary: Gets the marker closest to a reference position.
 * Remarks: Markers sought must have name format 'markerPreNameX' or format 'markerPreNameX_Y', where X is an integer value
 * specifying a marker number and Y is an integer value specifying a sub marker. Marker number must start with 1 and be an unbroken
 * ascending sequence. The same applies for all submarker sequences.
 * Arguments:
 *   _position: Reference position.
 *   _markerPreName: Marker name except the ending integer value.
 *   [_isTwoDimensional]: true if the marker sequence has sub markers, else false.
 * Returns: Marker name of closest marker. Empty string ("") if no marker was found.
 */
 
 private ["_position", "_markerPreName", "_isTwoDimensional", "_returnMarkerName"];
private ["_closestDistance", "_markerNo", "_subMarkerNo", "_markerName", "_distance"];

_position = _this select 0;
_markerPreName = _this select 1;
if (count _this > 2) then {_isTwoDimensional = _this select 2;} else {_isTwoDimensional = false};

_markerNo = 1;
_subMarkerNo = 1;
_closestDistance = 1000000;
_returnMarkerName = "";

if (_isTwoDimensional) then {
	_markerName = _markerPreName + str _markerNo + "_" + str _subMarkerNo;
}
else {
	_markerName = _markerPreName + str _markerNo;
};

while {[_markerName] call drn_fnc_CL_MarkerExists} do {
	if (_isTwoDimensional) then {
		while {[_markerName] call drn_fnc_CL_MarkerExists} do {

			_distance = (GetMarkerPos _markerName) distance _position;
			if (_distance < _closestDistance) then {
				_closestDistance = _distance;
				_returnMarkerName = _markerName;
			};

			_subMarkerNo = _subMarkerNo + 1;
			_markerName = _markerPreName + str _markerNo + "_" + str _subMarkerNo;
		};

		// Get next marker
		_markerNo = _markerNo + 1;
		_subMarkerNo = 1;
		_markerName = _markerPreName + str _markerNo + "_" + str _subMarkerNo;
	}
	else {
		_distance = (GetMarkerPos _markerName) distance _position;
		if (_distance < _closestDistance) then {
			_closestDistance = _distance;
		};		
	};
};

_returnMarkerName