if(isNil("A3E_CronTimer")) then {
	A3E_CronTimer = 0;
};
if(isNil("A3E_CronTime")) then {
	A3E_CronTime = 1;
};
if(isNil("A3E_CronProcesses")) then {
	A3E_CronProcesses= [];
};


_DTrg=createTrigger["EmptyDetector",[0,0,0]];
_DTrg setTriggerArea[0,0,0,true];
_DTrg setTriggerActivation["NONE","PRESENT",true];
_DTrg setTriggerStatements["isServer && time>=A3E_CronTimer",  "[] call a3e_fnc_chronos_run;", ""]; 