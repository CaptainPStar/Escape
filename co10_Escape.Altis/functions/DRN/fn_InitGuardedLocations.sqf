if (!isServer) exitWith {};

private ["_referenceGroup", "_locationMarkerName", "_side", "_infantryClasses", "_minSkill", "_maxSkill", "_spawnRadius", "_debug"];
private ["_locationNo", "_locationFullName", "_locationExists", "_isFaction", "_location", "_soldierType", "_soldierCount", "_soldier", "_soldiers", "_i"];
private ["_locationPos", "_minSoldierCount", "_maxSoldierCount", "_maxGroupsCount", "_possibleInfantryTypes", "_instanceNo", "_locationMapMarkerName"];

_referenceGroup = _this select 0;
_locationMarkerName = _this select 1;

_side = _this select 2;
if (count _this > 3) then {_infantryClasses = _this select 3;} else {_infantryClasses = [];};
if (count _this > 4) then {_maxGroupsCount = _this select 4;} else {_maxGroupsCount = 10;};
if (count _this > 5) then {_minSoldierCount = _this select 5;} else {_minSoldierCount = 5;};
if (count _this > 6) then {_maxSoldierCount = _this select 6;} else {_maxSoldierCount = 10;};
if (count _this > 7) then {_minSkill = _this select 7;} else {_minSkill = 0.3;};
if (count _this > 8) then {_maxSkill = _this select 8;} else {_maxSkill = 0.6;};
if (count _this > 9) then {_spawnRadius = _this select 9;} else {_spawnRadius = 750;};
//if (count _this > 10) then {_debug = _this select 10;} else {_debug = false;};
_debug = false;
_locationMapMarkerName = _this select 10;
_spawnHmg = _this select 11;
_hmgDist = _this select 12;


// Inf class choice
switch (_locationMapMarkerName) do {
	case "drn_CommunicationCenterMapMarker": {
		_possibleInfantryTypes = drn_arr_Escape_InfantryTypes;
	};
	case "drn_HeliBaseMapMarker": {
		_possibleInfantryTypes = drn_arr_Escape_InfantryTypes;
	};
	case "drn_AmmoDepotMapMarker": {
		_possibleInfantryTypes = A3E_addonsArrayINF select (floor(random (count A3E_addonsArrayINF)));
	};
};

diag_log _possibleInfantryTypes;

// Initialize global variable
sleep random 0.1;
if (isNil "drn_var_guardedLocationsInstanceNo") then {
    drn_var_guardedLocationsInstanceNo = 0;
}
else {
    drn_var_guardedLocationsInstanceNo = drn_var_guardedLocationsInstanceNo + 1;
};

_instanceNo = drn_var_guardedLocationsInstanceNo;
call compile format ["drn_var_guardedLocations%1 = [];", _instanceNo];

_locationNo = 0;
_locationFullName = _locationMarkerName + str _locationNo;


if (((getMarkerPos _locationFullName) select 0) != 0 || ((getMarkerPos _locationFullName) select 1 != 0)) then {
	_locationExists = true;
}
else {
	_locationExists = false;
};

while {_locationExists} do {
	_locationPos = getMarkerPos _locationFullName;

	_soldierCount = _minSoldierCount + floor (random (_maxSoldierCount - _minSoldierCount + 1));
    
	_soldiers = [];
	for [{_i = 0}, {_i < _soldierCount}, {_i = _i + 1}] do {
		_soldierType = _possibleInfantryTypes select (floor (random (count _possibleInfantryTypes)));

		// soldier: [type, skill, spawned, damage, obj, scriptHandle, hasScript]
		_soldier = [_soldierType, (_minSkill + random (_maxSkill - _minSkill)), false, 0, objNull, objNull, false];
		_soldiers set [count _soldiers, _soldier];
	};

	_location = [_locationFullName, "", _soldiers, _locationPos];

    _location call compile format ["drn_var_guardedLocations%1 set [count drn_var_guardedLocations%2, _this];", _instanceNo, _instanceNo];

    // Set enemy spawn trigger
    private ["_marker", "_count", "_populated", "_trigger"];
    
	
	switch (_spawnHmg) do {
		case true: {
		_trigger = createTrigger["EmptyDetector", getMarkerPos _locationFullName];
		_trigger triggerAttachVehicle [vehicle (units _referenceGroup select 0)];
		_trigger setTriggerArea[_spawnRadius, _spawnRadius, 0, false];
		_trigger setTriggerActivation["MEMBER", "PRESENT", true];
		_trigger setTriggerTimeout [1, 1, 1, true];
		_trigger setTriggerStatements["this", "_nil = [drn_var_guardedLocations" + str _instanceNo + " select " + str _locationNo + ", " + str _side + ", " + str _maxGroupsCount + ", " + str _hmgDist + ", " + str _debug + "] spawn drn_fnc_PopulateLocation_hmg;", "_nil = [drn_var_guardedLocations" + str _instanceNo + " select " + str _locationNo + ", " + str _debug + "] spawn drn_fnc_DepopulateLocation;"];
		};
		case false: {
		_trigger = createTrigger["EmptyDetector", getMarkerPos _locationFullName];
		_trigger triggerAttachVehicle [vehicle (units _referenceGroup select 0)];
		_trigger setTriggerArea[_spawnRadius, _spawnRadius, 0, false];
		_trigger setTriggerActivation["MEMBER", "PRESENT", true];
		_trigger setTriggerTimeout [1, 1, 1, true];
		_trigger setTriggerStatements["this", "_nil = [drn_var_guardedLocations" + str _instanceNo + " select " + str _locationNo + ", " + str _side + ", " + str _maxGroupsCount + ", " + str _debug + "] spawn drn_fnc_PopulateLocation;", "_nil = [drn_var_guardedLocations" + str _instanceNo + " select " + str _locationNo + ", " + str _debug + "] spawn drn_fnc_DepopulateLocation;"];
		};
    };
	// Map Marker Trigger
	_trigger2 = createTrigger["EmptyDetector", getMarkerPos _locationFullName];
    _trigger2 triggerAttachVehicle [vehicle (units _referenceGroup select 0)];
    _trigger2 setTriggerArea[300, 300, 0, false];
    _trigger2 setTriggerActivation["MEMBER", "PRESENT", false];
    _trigger2 setTriggerTimeout [1, 1, 1, true];
    _trigger2 setTriggerStatements["this", " _nil = [" + str _locationMapMarkerName +", " + str _locationNo + "] spawn A3E_fnc_markerChange;", ""];
	
	// Get next guarded position
	_locationNo = _locationNo + 1;
	_locationFullName = _locationMarkerName + str _locationNo;

	if (((getMarkerPos _locationFullName) select 0) != 0 || ((getMarkerPos _locationFullName) select 1 != 0)) then {
		_locationExists = true;
	}
	else {
		_locationExists = false;
	};
};

