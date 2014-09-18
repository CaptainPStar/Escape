if (!isServer) exitWith {};

diag_log "running unit classes MIXED";

_enemyFrequency = _this select 0;

[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\UnitClasses_Default.sqf";

A3E_addonsArrayINF set [0, drn_arr_Escape_InfantryTypes];
A3E_addonsArrayINF set [1, drn_arr_Escape_InfantryTypes_Ind];

// EAST WEST
if (isClass(configFile >> "cfgPatches" >> "sud_gw_data") && EvW_allowed) then {
	[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\mixed\UnitClasses_EastWest_mix.sqf";
	};

// CAF
if (isClass(configFile >> "cfgPatches" >> "caf_ag_equip") && CAF_allowed) then {
	[_enemyFrequency] call compile preprocessFileLineNumbers "Addons\Factions\mixed\UnitClasses_CAF_mix.sqf";
	};

// Toadie weapons
if (isClass(configFile >> "cfgPatches" >> "hlcweapons_core") && HLC_allowed) then {
	call compile preprocessFileLineNumbers "Addons\Weapons\HLC_Weapons.sqf";
	};