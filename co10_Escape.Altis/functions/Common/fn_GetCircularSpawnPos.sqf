private["_list","_pos","_return","_nearestPlayerDis"];
_list = [] call A3E_fnc_GetPlayers;
_return = [];

_pos = [];

A3E_MinSpawnCircleDistance = 1000;
A3E_MaxSpawnCircleDistance = 2000;
if(time<6) then {
	A3E_MinSpawnCircleDistance = 300;
};
for "_x" from 1 to 10 do {
	_pos = getposASL (_list select floor(random(count(_list))));
	_distance = A3E_MinSpawnCircleDistance + random(A3E_MaxSpawnCircleDistance-A3E_MinSpawnCircleDistance);
	_dir = random 360;
	_pos = [(_pos select 0)+cos(_dir)*_distance,(_pos select 1)+sin(_dir)*_distance,0];
	_nearestPlayerDis = [_pos] call A3E_fnc_GetNearestPlayerDistance;
	if(_nearestPlayerDis>=A3E_MinSpawnCircleDistance &&  !(surfaceIsWater _pos)) exitwith {_return = _pos;};
};
_return