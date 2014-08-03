private["_function","_calltype","_index","_return"];
_function = [_this, 0, ""] call BIS_fnc_param;
_calltype = [_this, 1, "spawn"] call BIS_fnc_param;
_index = [_this, 2, -1] call BIS_fnc_param;


if(_calltype == "call") then {
	call compile format["call %1;",_function];
} else {
	_return = call compile format["_return = [] spawn %1;_return",_function];
	if(_index>=0) then {
		A3E_CronProcesses set [_index,[(A3E_CronProcesses select _index) select 0,(A3E_CronProcesses select _index) select 1,_return]];
	};
};
