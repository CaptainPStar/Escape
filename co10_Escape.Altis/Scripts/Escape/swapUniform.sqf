private ["_target", "_caller"];

_target = _this select 0;
_caller = _this select 1;
//_id = _this select 2;

[[_target, _caller],"a3e_fnc_swapUniform",false,false] spawn BIS_fnc_MP;


//_obj removeaction _id;