diag_log "running unit classes PURE";

if (!isServer) exitWith {};



_enemyFrequency = _this select 0;


// CAF
if (isClass(configFile >> "cfgPatches" >> "caf_ag_equip") && CAF_allowed) then { 

	switch (A3E_Location) do {
		case "Africa": {
			 
				diag_log "Africa is the location and CAF is installed"; 
				[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\pure\UnitClasses_Africa_CAF.sqf"; 
			
		};
		case "EastEuro": {

				diag_log "Eastern Europe is the location and CAF is installed";
				[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\pure\UnitClasses_EastEuro_CAF.sqf";
			
		};
		case "Asia": {

				diag_log "Asia is the location and CAF is installed";
				[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\pure\UnitClasses_Asia_CAF.sqf";

		};
		case "MidEast": {

				diag_log "The Middle East is the location and CAF is installed";
				[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\pure\UnitClasses_MidEast_CAF.sqf";

		};
		case "SouthEuro": {

				diag_log "We're in default Arma 3 land";
				[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\UnitClasses_Default.sqf";

		};
	};
};

if (!(caf_allowed) && !(EvW_allowed)) then {
[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\UnitClasses_Default.sqf";
diag_log "Manual no no to Caf and EvW. Going default";
};

if (!(isClass(configFile >> "cfgPatches" >> "caf_ag_equip")) && !(isClass(configFile >> "cfgPatches" >> "sud_gw_data"))) then { 

[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\UnitClasses_Default.sqf";
diag_log "Nowt is installed. Going default";		
};

A3E_addonsArrayINF set [0, drn_arr_Escape_InfantryTypes];
A3E_addonsArrayINF set [1, drn_arr_Escape_InfantryTypes_Ind];
	
// EAST WEST
switch (true) do { 
	case (isClass(configFile >> "cfgPatches" >> "caf_ag_equip") && isClass(configFile >> "cfgPatches" >> "sud_gw_data") && EvW_allowed): {
			diag_log "Both CAF and EAST WEST are installed";
			[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\mixed\UnitClasses_EastWest_mix.sqf"; 
		};	
	case (isClass(configFile >> "cfgPatches" >> "sud_gw_data") && EvW_allowed): {
			diag_log "Just EAST WEST is installed";
			[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\pure\UnitClasses_EastWest.sqf"; 
		};	
};	


	
// Toadie weapons
if (isClass(configFile >> "cfgPatches" >> "hlcweapons_core") && HLC_allowed) then {
	call compile preprocessFileLineNumbers "Addons\Weapons\HLC_Weapons.sqf";
	};



	