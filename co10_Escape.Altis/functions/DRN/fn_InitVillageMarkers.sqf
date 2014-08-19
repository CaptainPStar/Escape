

drn_fnc_VillageMarkers_PutVillageMarkersOnMap = {
	private ["_showMarkers"];

	if (count _this > 0) then {_showMarkers = _this select 0;} else {_showMarkers = true};
	
	//create village markers
	call A3E_fnc_findBuildingsGrid;
};

if (isServer) then {
	[false] call drn_fnc_VillageMarkers_PutVillageMarkersOnMap;
};

drn_var_villageMarkersInitialized = true;
