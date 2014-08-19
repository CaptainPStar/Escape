/*
 * Summary: Starts the garbage collector. Garbage collector removes empty groups and units added by function drn_fnc_CL_AddUnitsToGarbageCollector every 10 seconds.
 * Remarks:
 *   This function must be spawned (not called).
 * Arguments:
 *   _referenceGroup: When distance is at least "clean up distance" to every unit in this group (preferrably player group), objects relevant to garbage collector will be garbage collected.
 *   [_cleanUpDistance]: Optional. Distance in meters at which objects will be garbage collected.
 *   [_debug]: Optional. true to enable debug mode, else false.
 */
 
 private ["_referenceGroup", "_cleanUpDistance", "_debug"];
    private ["_emptyGroups", "_groupsToDelete", "_unitsToDelete"];
    
    _referenceGroup = _this select 0;
    if (count _this > 1) then {_cleanUpDistance = _this select 1;} else {_cleanUpDistance = 750};
    if (count _this > 2) then { _debug = _this select 2; } else { _debug = false; };
    
    if (_debug) then {
        ["Garbage collector started."] call drn_fnc_CL_ShowDebugTextAllClients;
    };
    
    if (isNil "drn_var_CL_GarbageCollectorUnits") then {
        drn_var_CL_GarbageCollectorUnits = [];
    };
    
    _emptyGroups = [];
    
    while {true} do {
        
        // Find empty groups
        {
            if (count units _x <= 0) then {
                _emptyGroups set [count _emptyGroups, _x];
            };
        } foreach allGroups;        
        
        if (_debug) then {
            sleep 1;
        }
        else {
            sleep 10;
        };
        
        // Delete empty groups if they are still empty
        _groupsToDelete = [];
        {
            if (count units _x <= 0) then {
                _groupsToDelete set [count _groupsToDelete, _x];
            };
        } foreach _emptyGroups;
        
        _emptyGroups = _emptyGroups - _groupsToDelete;
        
        // Delete the groups
        {
            if (_debug) then {
                ["Group '" + str _x + "' garbage collected."] call drn_fnc_CL_ShowDebugTextAllClients;
            };
            
            deleteGroup _x;
        } foreach _groupsToDelete;
        
       /* // Delete units that are far away
        _unitsToDelete = [];
        {
            private ["_unit", "_farAway"];
            
            _unit = _x;
            _farAway = true;
            
            {
                if (_x distance _unit < _cleanUpDistance) then {
                    _farAway = false;
                };
            } foreach units _referenceGroup;
            
            if (_farAway) then {
                _unitsToDelete set [count _unitsToDelete, _unit];
            };
        } foreach drn_var_CL_GarbageCollectorUnits;
        
        drn_var_CL_GarbageCollectorUnits = drn_var_CL_GarbageCollectorUnits - _unitsToDelete;
        
        {
            private ["_group"];
            
            _group = group _x;
            
            if (_debug) then {
                ["Unit '" + str _x + "' garbage collected."] call drn_fnc_CL_ShowDebugTextAllClients;
            };
            deleteVehicle _x;
            
            if (str _group != "<NULL-group>") then {
                if (count units _group == 0) then {
                    if (_debug) then {
                        ["Group '" + str _group + "' garbage collected."] call drn_fnc_CL_ShowDebugTextAllClients;
                    };
                    
                    deleteGroup _group;
                };
            };
        } foreach _unitsToDelete;*/
    };