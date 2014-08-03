private ["_occupiedPositions"];
private ["_positions", "_i", "_j", "_tooCloseAnotherPos", "_pos", "_maxDistance", "_countNW", "_countNE", "_countSE", "_countSW", "_isOk","_regionCount"];

if (!isServer) exitWith {};

_occupiedPositions = [];
_positions = [];
_i = 0;
_maxDistance = A3E_MinObjDistance;

_countNW = 0;
_countNE = 0;
_countSE = 0;
_countSW = 0;

drn_var_Escape_HeliBasePositions = [];

if(isNil("A3E_HeliBaseCount")) then {
            A3E_HeliBaseCount = 8;
    }
	else
	{
	A3E_HeliBaseCount = A3E_AmmoDepotCount;
	};
	
_regionCount = ceil(A3E_HeliBaseCount/4);
while {count _positions < A3E_HeliBaseCount} do {
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
    } foreach _positions;



    if (!_tooCloseAnotherPos) then {
        _positions set [count _positions, _pos];
    };

    _i = _i + 1;
    if (_i > 100) exitWith {
        _positions
    };
};


{
    [_x,drn_arr_Escape_AmmoDepot_StaticWeaponClasses,drn_arr_Escape_AmmoDepot_ParkedVehicleClasses] call A3E_fnc_HeliBase;
} foreach _positions;

drn_var_Escape_HeliBasePositions = _positions;
publicVariable "drn_var_Escape_HeliBasePositions";