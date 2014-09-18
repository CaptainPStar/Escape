/*
 * Description: This file contains vheicle types and unit types for most units spawned in the mission.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 *
 * Except for the classes specified in this file, classes are specified in the following files: CreateSearchChopper.sqf, EscapeSurprises (RUSSIANSEARCHCHOPPER) 
 * and RunExtraction.sqf, all in folder Scripts\Escape\.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

diag_log "running unit classes EAST WEST MIX";

// Random array. Start position guard types.
If (random 100 > 50) then {
		drn_arr_Escape_StartPositionGuardTypes = ["SUD_USSR_Soldier_TL", "SUD_USSR_Soldier_AR", "SUD_USSR_Soldier"];
		};
		



drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses + ["SUD_UAZ", "SUD_BRDM2",  "SUD_URAL", "SUD_HMMWV", "SUD_TRUCK5t", "SUD_BTR60"];
drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND + ["SUD_UAZ", "SUD_BRDM2",  "SUD_URAL", "SUD_HMMWV", "SUD_TRUCK5t", "SUD_BTR60"];


// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
drn_arr_Escape_InfantryTypes_EW =      ["SUD_USSR_Soldier_TL", "SUD_USSR_Soldier_AR", "SUD_USSR_Soldier_GL", "SUD_USSR_Soldier_AT", "SUD_USSR_Soldier", "SUD_USSR_Soldier_Medic"];

// Add to possible INF types
A3E_addonsArrayINF set [(count A3E_addonsArrayINF), drn_arr_Escape_InfantryTypes_EW];


// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
drn_arr_Escape_RoadBlock_MannedVehicleTypes = drn_arr_Escape_RoadBlock_MannedVehicleTypes + ["SUD_UAZ", "SUD_BRDM2",  "SUD_URAL", "SUD_HMMWV", "SUD_TRUCK5t", "SUD_BTR60"];

drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind + ["SUD_UAZ", "SUD_BRDM2",  "SUD_URAL", "SUD_HMMWV", "SUD_TRUCK5t", "SUD_BTR60"];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
drn_arr_Escape_MotorizedSearchGroup_vehicleClasses = drn_arr_Escape_MotorizedSearchGroup_vehicleClasses + ["SUD_UAZ", "SUD_BMP2", "SUD_BRDM2", "SUD_BTR60", "SUD_HMMWV"];
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
drn_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = drn_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo + [5, 3, 5, 5, 4];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_lightArmorClasses = drn_arr_ComCenDefence_lightArmorClasses + ["SUD_HMMWV_M2", "SUD_BMP2", "SUD_BRDM2"];
// Random array. Heavy armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_heavyArmorClasses = drn_arr_ComCenDefence_heavyArmorClasses + ["SUD_BMP2", "SUD_BRDM2"];


// A communication center have two parked and empty vehicles of the following possible types.
drn_arr_ComCenParkedVehicles = drn_arr_ComCenParkedVehicles + ["SUD_UAZ", "SUD_BRDM2",  "SUD_URAL", "SUD_HMMWV", "SUD_TRUCK5t", "SUD_BTR60", "SUD_BMP2"];
		

// An ammo depot have one parked and empty vehicle of the following possible types.
drn_arr_Escape_AmmoDepot_ParkedVehicleClasses = drn_arr_Escape_AmmoDepot_ParkedVehicleClasses + ["SUD_UAZ", "SUD_URAL", "SUD_TRUCK5t"];


// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in the basic weapons box

drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_SUD_AK74", 80, 4, 8, ["SUD_30rnd_545x39_AK"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_SUD_AK74_GL", 80, 4, 8, ["SUD_1rnd_HE_GP25"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["LMG_SUD_PK", 60, 4, 8, ["SUD_100rnd_762x54_PK"], 8]];

//NATO
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_SUD_M16", 60, 4, 8, ["SUD_30Rnd_556x45_STANAG"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_SUD_M16_GL", 60, 4, 8, ["SUD_1rnd_HE_M203"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["LMG_SUD_M60", 60, 4, 8, ["SUD_100Rnd_762x51_M60"], 8]];

// Weapons and ammo in the launchers box

drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_SUD_RPG7V", 60, 3, 5, ["SUD_PG7VL"], 6]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_SUD_CarlGustaf", 60, 3, 5, ["SUD_HEAT751"], 6]];


// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["SUD_Binocular", 50, 25, 25, [], 0]];

if(!a3e_var_noNV) then {
	drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["SUD_NVG", 15, 10, 10]];
};
// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.



drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["arifle_SUD_AK74", "SUD_30rnd_545x39_AK", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["arifle_SUD_AK74_GL", "SUD_1rnd_HE_GP25", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["LMG_SUD_PK", "SUD_100rnd_762x54_PK", 8]];

drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["arifle_SUD_M16", "SUD_30Rnd_556x45_STANAG", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["arifle_SUD_M16_GL", "SUD_1rnd_HE_M203", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["LMG_SUD_M60", "SUD_100Rnd_762x51_M60", 8]];



