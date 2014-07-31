/*
 * Summary: Adds units to garbage collector. Units added to garbage collector (dead or alive) are deleted when on "clean up distance" from reference group.
 * Arguments:
 *   _this: Array of units to add to garbage collector.
 */
 
private ["_units"];
_units = _this;

 /*if (isNil "drn_var_CL_GarbageCollectorUnits") then {
	drn_var_CL_GarbageCollectorUnits = [];
};

drn_var_CL_GarbageCollectorUnits = drn_var_CL_GarbageCollectorUnits + _units;*/