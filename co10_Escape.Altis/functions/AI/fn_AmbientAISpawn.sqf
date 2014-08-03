private["_grouplist","_group","_spawnpos"];
if(isNil("A3E_AmbientAIGroups")) then {
	A3E_AmbientAIGroups = [];
};
_grouplist = [];

{
	if(count(units _x)==0) then {
		systemchat format["Group %1 deleted",_x];
		deletegroup _x;
	} else {
		_grouplist set [count(_grouplist),_x];
	};

} foreach A3E_AmbientAIGroups;
A3E_AmbientAIGroups = _grouplist;
if(count(A3E_AmbientAIGroups)>=A3E_MaxAmbientAIGroups) exitwith {};

_spawnpos = [] call A3E_fnc_GetCircularSpawnPos;
if(count(_spawnpos)==3) then {
	_group = [_spawnpos,A3E_EnemySide,4] call A3E_FNC_SpawnGroup;
	A3E_AmbientAIGroups set [count(A3E_AmbientAIGroups),_group];
	[_group] call A3E_fnc_Patrol;
	[_group] spawn A3E_fnc_TrackGroup_Add;
};


