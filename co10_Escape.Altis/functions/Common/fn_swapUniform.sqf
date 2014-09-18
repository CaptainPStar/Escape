
	private ["_target", "_caller","_uniTarget", "_uniCaller", "_class"];
	_target = _this select 0;
	_caller = _this select 1;

	
	_uniTarget = uniform _target;
	_class = typeof _target;
	//_uniTarget = getText (configFile >> "CfgVehicles" >> _class >> "uniformclass");
	_uniCaller = uniform _caller;
	//_caller playmovenow "AinvPknlMstpSlayWrflDnon_medic";
	[[_caller,"AinvPknlMstpSlayWrflDnon_medic"],"at_fnc_revive_playMove"] call BIS_fnc_MP;
	sleep 1.5;	
	RemoveUniform _target;
	sleep 1.5;
	RemoveUniform _caller;
	sleep 1.5;
	_target forceAddUniform _uniCaller;	
	sleep 1.5;	
	_caller forceAddUniform _uniTarget;
	
/*

private ["_target", "_caller"];

_target = _this select 0;
_caller = _this select 1;
//_id = _this select 2;

[[_target, _caller],"fnc_AoW_stealUniform",true,true] spawn BIS_fnc_MP;


//_obj removeaction _id;

*/