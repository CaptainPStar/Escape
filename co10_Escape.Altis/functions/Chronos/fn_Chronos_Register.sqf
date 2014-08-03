private["_function","_calltype"];
_function = [_this, 0, ""] call BIS_fnc_param;
_calltype = [_this, 1, "spawn"] call BIS_fnc_param;

A3E_CronProcesses set [count(A3E_CronProcesses),[_function,_calltype]];