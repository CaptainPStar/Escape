if (!isServer) exitWith {};

private ["_location", "_markerName", "_debug", "_soldierObjects", "_spawned", "_damage", "_soldier", "_script"];

_location = _this select 0;



if (count _this > 1) then {_debug = _this select 1;} else {_debug = false;};

_markerName = _location select 0;
_soldierObjects = _location select 2;



if (_debug) then {
    player sideChat "Depopulating location (" + _markerName + ")";
};

{
    private ["_group", "_soldierObject", "_hasScript"];
	_soldierObject = _x;
    
	//_soldierType = _soldier select 0;
	//_skill = _soldier select 1;
	_spawned = _soldierObject select 2;
	_damage = _soldierObject select 3;
	_soldier = _soldierObject select 4;
	//_script = _soldierObject select 5;
    //_hasScript = _soldierObject select 6;

	if (_spawned) then {
	
	[[_soldier], "aow_fnc_removeActions"] call BIS_fnc_MP;
	
		_damage = damage _soldier;
		if (!canStand _soldier) then {
			_damage = 1;
		};

        
        _group = group _soldier;
        deleteVehicle _soldier;
		
		_script = _group getvariable ["A3E_GroupPatrolScript",nil];
		if(!isNil("_script")) then {
			if (!(scriptDone _script)) then {
				terminate _script;
			};
		};
		
        deleteGroup _group;

        _soldierObject set [2, false];
        _soldierObject set [3, _damage];
        _soldierObject set [4, objNull];
        _soldierObject set [5, objNull];
        _soldierObject set [6, false];
    };


	
} foreach _soldierObjects;


//// delete HMGs

_markerPos = [];
_markerPos = getMarkerPos _markerName;
_hmgList = _markerPos nearObjects ["O_HMG_01_high_F", 150];


//{deleteVehicle _x} forEach (crew AIRCRAFTNAME)+[AIRCRAFTNAME]

{
_crew = crew _x;
	{deleteVehicle _x;} forEach _crew;	 
deleteVehicle _x;
} forEach _hmgList;

/*
{
	_x action ["Eject", car];
} forEach crew car;
deleteVehicle car
*/

