
[] call compile preprocessFileLineNumbers "functions\RandomEvents\fn_RandomEvent_HearthAttack.sqf";
A3E_RandomEvents = ["A3E_FNC_RandomEvent_HearthAttack"];

A3E_FNC_RandomEvent_Run = {
	if(random 100 > 90) then {
		call compile format["[] spawn %1;",A3E_RandomEvents select floor(random(count(A3E_RandomEvents)))];
	};
};