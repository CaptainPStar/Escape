fnc_AoW_stealUniform = {
	private ["_target", "_caller","_uniTarget", "_uniCaller", "_class"];
	_target = _this select 0;
	_caller = _this select 1;

	_uniTarget = uniform _target;
	_class = typeof _target;
	//_uniTarget = getText (configFile >> "CfgVehicles" >> _class >> "uniformclass");
	_uniCaller = uniform _caller;
	RemoveUniform _target;
	RemoveUniform _caller;
	_caller addUniform _uniTarget;
	_target addUniform _uniCaller;
};

private ["_target", "_caller"];

_target = _this select 0;
_caller = _this select 1;
//_id = _this select 2;

[[_target, _caller],"fnc_AoW_stealUniform",true,true] spawn BIS_fnc_MP;


//_obj removeaction _id;