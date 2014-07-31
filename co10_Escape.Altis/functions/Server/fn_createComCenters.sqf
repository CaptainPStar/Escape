private ["_comCenNo","_comCenMarkerNames","_markerCoreName","_markerName","_instanceNo","_marker","_chosenComCenIndexes","_comCenPositions","_distanceBetween","_pos","_occupiedPositions","_i","_j","_tooCloseAnotherPos","_maxDistance","_countNW","_countNE","_countSE","_countSW","_isOk","_regionCount","_commCentreMarkers"];

_occupiedPositions = [];
_chosenComCenIndexes = [];
_i = 0;
_maxDistance = A3E_MinObjDistance;

_countNW = 0;
_countNE = 0;
_countSE = 0;
_countSW = 0;

_comCenMarkerNames = [];
_comCenNo = 1;
_markerCoreName = "drn_var_communicationCenter";
_markerName = _markerCoreName + str _comCenNo;



private["_index","_chosenComCenIndexes","_commCentreMarkers"];
_chosenComCenIndexes = [];

//_distanceBetween = A3E_MinComCenterDistance;

 if(isNil("drn_arr_communicationCenterMarkers")) then {
            drn_arr_communicationCenterMarkers = [];
    };
_commCentreMarkers = drn_arr_communicationCenterMarkers;

    if(isNil("A3E_ComCenterCount")) then {
            A3E_ComCenterCount = 3;
    };
_regionCount = ceil(A3E_ComCenterCount/4);
while {count _chosenComCenIndexes < A3E_ComCenterCount} do {
    _isOk = false;
    _j = 0;

    while {!_isOk} do {
        _pos = call A3E_fnc_findFlatArea;
        _isOk = true;
		
		{
		
		If ((_pos distance _x) < A3E_MinObjDistance) then {
			_isOk = false;
			};
		} foreach banned_positions;
		
        if (_pos select 0 <= ((getpos center) select 0) && _pos select 1 > ((getpos center)select 1)) then {
            if (_countNW <= _regionCount) then {
                _countNW = _countNW + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 > ((getpos center)select 0) && _pos select 1 > ((getpos center)select 1)) then {
            if (_countNE <= _regionCount) then {
                _countNE = _countNE + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 > ((getpos center)select 0) && _pos select 1 <= ((getpos center)select 1)) then {
            if (_countSE <= _regionCount) then {
                _countSE = _countSE + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 <= ((getpos center)select 0) && _pos select 1 <= ((getpos center)select 1)) then {
            if (_countSW <= _regionCount) then {
                _countSW = _countSW + 1;
            }
            else {
                _isOk = false;
            };
        };

        _j = _j + 1;
        if (_j > 100) then {
            _isOk = true;
        };
    };

    _tooCloseAnotherPos = false;
    {
        if (_pos distance _x < _maxDistance) then {
            _tooCloseAnotherPos = true;
        };
    } foreach _chosenComCenIndexes;



    if (!_tooCloseAnotherPos) then {
        _chosenComCenIndexes set [count _chosenComCenIndexes, _pos];
    };

    _i = _i + 1;
    if (_i > 100) exitWith {
        _chosenComCenIndexes
    };
};


 _comCenPositions = [];
 _instanceNo = 0;
{
    private ["_index"];
    private ["_pos", "_dir"];

//    _index = _x;
//    _comCenItem = drn_arr_communicationCenterMarkers select _index;

    _pos = _x;
    _dir = random 360;
    _comCenPositions set [count _comCenPositions, _pos];

    //scriptHandle = 
    [_pos, _dir,drn_arr_ComCenStaticWeapons,drn_arr_ComCenParkedVehicles] call a3e_fnc_BuildComCenter;
    //waitUntil {scriptDone _scriptHandle};

    _marker = createMarker ["drn_CommunicationCenterMapMarker" + str _instanceNo, _pos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "flag_CSAT";


    _marker = createMarkerLocal ["drn_CommunicationCenterPatrolMarker" + str _instanceNo, _pos];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerAlpha 0;
    _marker setMarkerSizeLocal [50, 50];

    _instanceNo = _instanceNo + 1;
} foreach _chosenComCenIndexes;

//["Total Comms Centres = " + str count _chosenComCenIndexes] call drn_fnc_CL_ShowDebugTextAllClients;

drn_var_Escape_communicationCenterPositions = _chosenComCenIndexes;
publicVariable "drn_var_Escape_communicationCenterPositions";

    