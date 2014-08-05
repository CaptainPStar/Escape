private ["_installDist","_startPos","_result","_countNW","_isOk","_countNE","_countSE","_countSW","_installCount","_badPos","_gradient","_roadSegments","_buildings","_tooClose","_installNo","_regionCount","_installPos","_tooCloseNo"];

_countNW = 0;
_countNE = 0;
_countSE = 0;
_countSW = 0;

_installNo = _this select 0;
_installDist = _this select 1;

if (isnil "_installDist") then {
		_installDist = A3E_MinObjDistance;
	};
	
_regionCount = ceil(_installNo / 4);

_installCount = 0;
_installPos = [];
_badPos = 0;
_tooCloseNo = 0;
_gradient = Param_BuildingGradient;

/// main loop for finding locations
for "_i" from 0 to 1 step 0 do {

_result = [];

	waitUntil {	
	//diag_log "waiting for _result";
	_startPos = [(SWpos select 0) + random (NEpos select 0) + 20,(SWpos select 1) + random (NEpos select 1) + 20, 0];
	_result = _startPos isFlatEmpty [5, 0, _gradient, 50, 0, false, objNull];
	((count _result) > 0)
	};

//hintsilent format ["_installNo = %1 \n _installCount = %2 \n _badPos = %3 \n _tooCloseNo = %4 \n _installDist = %5", _installNo, _installCount, _badPos, _tooCloseNo, _installDist];


/// check if too close to a banned position
_tooClose = 0;
_tooClose = {(_x distance _result) < _installDist} count A3E_var_bannedpositions;

if (_tooClose > 0) then {_tooCloseNo = _tooCloseNo + 1};


if ((!surfaceIsWater _result) && (_tooClose == 0)) then
	{
	
	/// switch for region spread	

	_isOk = false;
	
	switch (true) do
	{
		case (_result select 0 <= ((getpos center) select 0) && _result select 1 > ((getpos center)select 1)): 
			{
			if (_countNW <= _regionCount) then {
					_countNW = _countNW + 1;
					_isOk = true;
				}
				else {
					_isOk = false;
				};
			};
		case (_result select 0 > ((getpos center)select 0) && _result select 1 > ((getpos center)select 1)): 
			{
			if (_countNE <= _regionCount) then {
					_countNE = _countNE + 1;
					_isOk = true;
				}
				else {
					_isOk = false;
				};
			};
		case (_result select 0 > ((getpos center)select 0) && _result select 1 <= ((getpos center)select 1)):
			{
			if (_countSE <= _regionCount) then {
					_countSE = _countSE + 1;
					_isOk = true;
				}
				else {
					_isOk = false;
				};
			};
		case (_result select 0 <= ((getpos center)select 0) && _result select 1 <= ((getpos center)select 1)):
			{
			if (_countSW <= _regionCount) then {
					_countSW = _countSW + 1;
					_isOk = true;
				}
				else {
					_isOk = false;
				};
			};
		default {_isOk = false};
	};
	
	
		switch (_isOk) do
		{
		case true:
			{
            _installPos set [_installCount, _result];
			A3E_var_bannedpositions set [(count A3E_var_bannedpositions), _result];
			_installCount = _installCount +1;			
			
			};
		case false:
			{
			_badPos = _badPos + 1;			
			};
		};
	};

	
if (_installCount == _installNo) exitWith {};		
if (_badPos > 200) then {_installDist = ((_installDist / 3) * 2); _badPos = 0;diag_log _result;
			diag_log _tooClose;
			diag_log _isOk;};
			
				
	};	

_installPos	