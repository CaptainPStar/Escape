private["_startTime","_debug"];
_startTime = diag_tickTime;
_debug = true;

{
	if((_x select 1)=="call") then {
		[_x select 0,_x select 1] call a3e_fnc_chronos_dispatch;
	} else {
		if(count(_x)<=2 || {scriptDone (_x select 2)}) then {
			[_x select 0,_x select 1,_forEachIndex] call a3e_fnc_chronos_dispatch;
		} else {
			if(_debug) then {
				systemchat format ["Process%1 (%2) was not finished after one Chronoscycle!",_forEachIndex,(_x select 0)];
			};
		};
	};
} foreach A3E_CronProcesses;


if(diag_tickTime>_startTime+A3E_CronTime) then {systemChat "Warning, Chronos is under heavy load!";};
if(_debug) then {
	systemchat format ["Chronos Runtime: %1",diag_tickTime-_startTime];
};
A3E_CronTimer = time + A3E_CronTime;
