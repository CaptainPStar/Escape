private ["_road","_roadConnectedTo","_connectedRoad","_direction","_marker","_markCount","_startPos","_nearRoads","_locations","_instanceNo","_markPos","_locName","_typeVar","_xPos","_yPos","_xDivs","_yDivs","_spacing","_radius","_divs", "_markerName"];


_locations = [];
_markPos = [];
_instanceNo = 0;
_locName = "";
_typeVar = "";
_startPos = [0,0,0];
_nearRoads = 0;
_markCount = 0;
_road = 0;
_roadConnectedTo = 0;
_connectedRoad = 0;
_direction = 0;
_Divs = 80;
_spacing = 0;
_radius = 0;

//drn_villageMarkers = [];
_spacing = (A3E_WorldSize / _divs);
_xPos = 0;
_yPos = 0;

_radius = _spacing / 2;

_offset = _radius + 100;
_xPos = _offset;
_yPos = _offset;

/// grid pick location

for "_i" from 0 to _Divs do {

	
		for "_j" from 0 to _Divs do {
		
			_startPos = [_xPos, _yPos, 0];
			_locations = _startPos nearObjects ["House", _radius];
			_nearRoads = _startPos nearRoads 100;
			_roadCount = count _nearRoads;
			_locCount = count _locations;
		
		switch true do {
			case (count _nearRoads > 0 && count roadsConnectedTo (_nearRoads select 0) > 0): {
				_road = _nearRoads select 0;
				_roadConnectedTo = roadsConnectedTo _road;
				_connectedRoad = _roadConnectedTo select 0;
				_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
				};
			default { _direction = 0; };
			};
	
		switch true do {
			case (_locCount > 4 && _roadCount > 0): 
				{
				_markerName = "drn_villageMarker" + str _markCount;
				_marker = createMarkerLocal [_markerName, _startPos];
				_marker setMarkerShape "RECTANGLE";
				_marker setMarkerSize [_radius, _radius];
				//_marker setMarkerColor "ColorYellow";
				_marker setMarkerDir _direction;
				_marker setMarkerAlpha 0;
				_markCount = _markCount + 1;
				//drn_villageMarkers set [count drn_villageMarkers, _startPos];

				};
			};
/*			
		switch true do {
			case (_locCount > 4 && _locCount < 15 && _roadCount > 0): 
				{
				_marker = createMarker ["drn_villageMarker" + str _instanceNo, _startPos];
				_marker setMarkerShape "RECTANGLE";
				_marker setMarkerSize [_radius, _radius];
				_marker setMarkerColor "ColorYellow";
				_marker setMarkerDir _direction;
				_markCount = _markCount + 1;
				//drn_villageMarkers set [count drn_villageMarkers, _startPos];
				};
			case (_locCount > 14 && _locCount < 20  && _roadCount > 0): 
				{
				_marker = createMarker ["drn_villageMarker" + str _instanceNo, _startPos];
				_marker setMarkerShape "RECTANGLE";
				_marker setMarkerSize [_radius, _radius];
				_marker setMarkerColor "ColorOrange";
				_marker setMarkerDir _direction;
				_markCount = _markCount + 1;
				//drn_villageMarkers set [count drn_villageMarkers, _startPos];
				};
			case (_locCount > 19 && _roadCount > 0): 
				{
				_marker = createMarker ["drn_villageMarker" + str _instanceNo, _startPos];
				_marker setMarkerShape "RECTANGLE";
				_marker setMarkerSize [_radius, _radius];
				_marker setMarkerColor "ColorRed";
				_marker setMarkerDir _direction;
				_markCount = _markCount + 1;
				//drn_villageMarkers set [count drn_villageMarkers, _startPos];
				};
			};
*/			
			_xPos = _xPos + _spacing;		
			_instanceNo = _instanceNo + 1;
			
		};
		
	_yPos = _yPos + _spacing;
	_xPos = _offset;

};
