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

// Random array. Start position guard types.
drn_arr_Escape_StartPositionGuardTypes = ["CAF_AG_ME_T_AK47", "CAF_AG_ME_T_AK74", "CAF_AG_ME_T_GL", "CAF_AG_ME_T_PKM"];
// Inner fence guard's secondary weapon (and corresponding magazine type).
drn_var_Escape_InnerFenceGuardSecondaryWeapon = [];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["hgun_ACPC2_F","9Rnd_45ACP_Mag"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["hgun_Rook40_F","16Rnd_9x21_Mag"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["hgun_PDW2000_F","30Rnd_9x21_Mag"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["hgun_P07_F","16Rnd_9x21_Mag"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["hgun_P07_snds_F","30Rnd_9x21_Mag"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["hgun_Rook40_snds_F","30Rnd_9x21_Mag"]];

_mechArray = ["WAP_03_CSAT_AS", "WAP_03_Blue_AS", "WAP_03_Red_Random_AS", "WAP_03_Blue_Random_AS", "WAP_03_Red_AS", "WAP_02_CSAT_AS", "WAP_02_CSAT_AS_2", "WAP_02_CSAT_GN", "WAP_02_CSAT_LC", "WAP_02_Red_Random_LC", "WAP_02_Blue_Random_LC", "G_WAP_03_Blue_AS"];
// Random array. Civilian vehicle classes for ambient traffic. (Can also be set to a faction name).
drn_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = ["C_Offroad_01_F", "C_Quadbike_01_F", "C_Van_01_box_F", "C_Van_01_fuel_F"];


if (RDSCars_allowed) then {
	_RDSCarArray = ["RDS_Ikarus_Civ_01", "RDS_Ikarus_Civ_02", "RDS_Lada_Civ_01", "RDS_Lada_Civ_02", "RDS_Lada_Civ_03", "RDS_Lada_Civ_04", "RDS_Lada_Civ_05", "RDS_S1203_Civ_01", "RDS_S1203_Civ_02", "RDS_S1203_Civ_03", "RDS_Gaz24_Civ_01", "RDS_Gaz24_Civ_02", "RDS_Gaz24_Civ_03", "RDS_Golf4_Civ_01", "RDS_Octavia_Civ_01", "RDS_Van_01_transport_F", "RDS_Van_01_box_F"];
	drn_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = drn_arr_Escape_MilitaryTraffic_CivilianVehicleClasses + _RDSCarArray;
	};
	
if (karts_allowed) then {
	_kartArray = ["C_Kart_01_F"];
	drn_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = drn_arr_Escape_MilitaryTraffic_CivilianVehicleClasses + _kartArray;
	};
	
// Random arrays. Enemy vehicle classes for ambient traffic. (Can also be set to a faction name).
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).

drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_Offroad_armed_01",  "CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_van_01", "O_Quadbike_01_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_02_ammo_F", "O_Truck_02_box_F", "O_Truck_02_fuel_F", "O_Truck_02_medical_F", "O_MRAP_02_hmg_F"];
drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = ["CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_Offroad_armed_01",  "CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_van_01", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_F"];

if (mechs_allowed) then {
	drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses + _mechArray;
};


// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
drn_arr_Escape_InfantryTypes =      ["CAF_AG_ME_T_AK47", "CAF_AG_ME_T_AK74", "CAF_AG_ME_T_GL", "CAF_AG_ME_T_RPG", "CAF_AG_ME_T_RPK74", "CAF_AG_ME_T_SVD", "O_engineer_F", "O_medic_F", "O_Soldier_exp_F", "O_Soldier_repair_F"];
drn_arr_Escape_InfantryTypes_Ind =  ["CAF_AG_ME_T_AK47", "CAF_AG_ME_T_AK74", "CAF_AG_ME_T_GL", "CAF_AG_ME_T_RPG", "CAF_AG_ME_T_RPK74", "CAF_AG_ME_T_SVD"];
a3n_arr_recon_InfantryTypes = ["CAF_AG_ME_T_AK47", "CAF_AG_ME_T_AK74", "CAF_AG_ME_T_GL", "CAF_AG_ME_T_RPG", "CAF_AG_ME_T_RPK74", "CAF_AG_ME_T_SVD", "O_recon_exp_F", "O_recon_JTAC_F", "O_recon_M_F", "O_recon_medic_F", "O_recon_F", "O_recon_LAT_F", "O_recon_TL_F"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
drn_arr_Escape_RoadBlock_MannedVehicleTypes = ["CAF_AG_ME_T_Offroad_armed_01",  "CAF_AG_ME_T_Offroad", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_F", "O_HMG_01_high_F", "O_HMG_01_high_F", "O_static_AT_F", "O_static_AA_F"];
if (mechs_allowed) then {
		_arrayLength = count drn_arr_Escape_RoadBlock_MannedVehicleTypes;
		drn_arr_Escape_RoadBlock_MannedVehicleTypes set  [_arrayLength, "WAP_02_CSAT_AS"];
		};
		
drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = ["CAF_AG_ME_T_Offroad_armed_01",  "CAF_AG_ME_T_Offroad", "I_G_Offroad_01_armed_F", "I_static_AT_F"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
drn_arr_Escape_ReinforcementTruck_vehicleClasses = ["O_Truck_02_covered_F", "O_Truck_02_transport_F"];
drn_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = ["I_Truck_02_transport_F", "I_Truck_02_covered"];
// Total cargo for reinforcement trucks. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_ReinforcementTruck_vehicleClasses above.
drn_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo = [16, 16, 16, 16];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
drn_arr_Escape_MotorizedSearchGroup_vehicleClasses = ["O_G_Offroad_01_armed_F", "CAF_AG_ME_T_Offroad_armed_01"];
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
drn_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = [3, 3];

if (mechs_allowed) then {
			drn_arr_Escape_MotorizedSearchGroup_vehicleClasses = drn_arr_Escape_MotorizedSearchGroup_vehicleClasses + _mechArray;
			drn_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = [3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2];
		};
		


// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_lightArmorClasses = ["CAF_AG_ME_T_Offroad_armed_01", "O_MRAP_02_hmg_F"];
// Random array. Heavy armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_heavyArmorClasses = ["O_MBT_02_cannon_F", "O_APC_Tracked_02_AA_F"];

if (mechs_allowed) then {
			drn_arr_ComCenDefence_heavyArmorClasses = drn_arr_ComCenDefence_heavyArmorClasses + _mechArray;
		};
		
// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
drn_arr_ComCenStaticWeapons = ["I_HMG_01_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
drn_arr_ComCenParkedVehicles = ["CAF_AG_ME_T_Offroad_armed_01",  "CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_van_01", "C_Offroad_01_F", "C_Van_01_transport_F", "O_MRAP_02_F", "I_G_Offroad_01_armed_F", "I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F", "I_G_Offroad_01_F"];

if (mechs_allowed) then {
			drn_arr_ComCenParkedVehicles = drn_arr_ComCenParkedVehicles + _mechArray;
		};
		
// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
drn_arr_Escape_EnemyCivilianCarTypes = ["RDS_Ikarus_Civ_01", "RDS_Ikarus_Civ_02", "RDS_Lada_Civ_01", "RDS_Lada_Civ_02", "RDS_Lada_Civ_03", "RDS_Lada_Civ_04", "RDS_Lada_Civ_05", "RDS_S1203_Civ_01", "RDS_S1203_Civ_02", "RDS_S1203_Civ_03", "RDS_Gaz24_Civ_01", "RDS_Gaz24_Civ_02", "RDS_Gaz24_Civ_03", "RDS_Golf4_Civ_01", "RDS_Octavia_Civ_01", "RDS_Van_01_transport_F", "RDS_Van_01_box_F", "C_Offroad_01_F"];

if (RDSCars_allowed) then {
	_RDSCarArray = ["RDS_Ikarus_Civ_01", "RDS_Ikarus_Civ_02", "RDS_Lada_Civ_01", "RDS_Lada_Civ_02", "RDS_Lada_Civ_03", "RDS_Lada_Civ_04", "RDS_Lada_Civ_05", "RDS_S1203_Civ_01", "RDS_S1203_Civ_02", "RDS_S1203_Civ_03", "RDS_Gaz24_Civ_01", "RDS_Gaz24_Civ_02", "RDS_Gaz24_Civ_03", "RDS_Golf4_Civ_01", "RDS_Octavia_Civ_01", "RDS_Hatchback_01_F", "RDS_Van_01_transport_F", "RDS_Van_01_box_F"];
	drn_arr_Escape_EnemyCivilianCarTypes = drn_arr_Escape_EnemyCivilianCarTypes + _RDSCarArray;
	};
	
if (karts_allowed) then {
	_kartArray = ["C_Kart_01_F"];
	drn_arr_Escape_EnemyCivilianCarTypes = drn_arr_Escape_EnemyCivilianCarTypes + _kartArray;
	};

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
drn_arr_Escape_AmmoDepot_StaticWeaponClasses = ["O_HMG_01_high_F", "O_GMG_01_high_F", "O_HMG_01_high_F", "O_static_AT_F", "O_static_AA_F"];
// An ammo depot have one parked and empty vehicle of the following possible types.
drn_arr_Escape_AmmoDepot_ParkedVehicleClasses = ["RDS_Ikarus_Civ_01", "RDS_Ikarus_Civ_02", "CAF_AG_ME_T_Offroad_armed_01",  "CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_van_01", "O_Truck_02_covered_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_F"];


// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in the basic weapons box
drn_arr_AmmoDepotBasicWeapons = [];
// CSAT weapons
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hgun_Rook40_F", 40, 4, 8, ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["SMG_02_F", 40, 4, 8, ["30Rnd_9x21_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["CAF_AK47", 80, 4, 8, ["CAF_30RND_762x39_AK"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["CAF_AK74", 80, 4, 8, ["CAF_30RND_545x39_AK"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["CAF_AK74GL", 60, 4, 8, ["CAF_30RND_545x39_AK"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Katiba_F", 8, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Katiba_C_F", 8, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Katiba_GL_F", 8, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Mk20_F", 15, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Mk20_GL_F", 15, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Mk20C_F", 15, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6]];
// non-CSAT weapons
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hgun_P07_F", 40, 4, 8, ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hgun_PDW2000_F", 40, 4, 8, ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hgun_Pistol_heavy_02_F", 40, 4, 8, ["6Rnd_45ACP_Cylinder"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hgun_ACPC2_F", 40, 4, 8, ["9Rnd_45ACP_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["SMG_01_F", 40, 4, 8, ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green"], 6]];
//drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_MX_F", 40, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
//drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_MX_GL_F", 40, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "3Rnd_HE_Grenade_shell", "3Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F", "3Rnd_UGL_FlareWhite_F"], 6]];
//drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_MX_SW_F", 40, 2, 4, ["50Rnd_65x39_caseless_mag", "50Rnd_65x39_caseless_mag_Tracer", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
//drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_MXC_F", 40, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
//drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_MXM_F", 40, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
//drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_SDAR_F", 40, 2, 4, ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_TRG20_F", 5, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_TRG21_F", 5, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_TRG21_GL_F", 5, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6]];


// Weapons and ammo in the special weapons box
drn_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["CAF_SVD", 80, 2, 4, ["CAF_10RND_762X54_SVD"], 14]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["CAF_PKM", 80, 2, 4, ["CAF_100RND_762x54_PKM"], 6]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["CAF_RPK74", 80, 2, 4, ["CAF_75RND_545x39_RPK"], 7]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["srifle_LRR_F", 5, 2, 4, ["7Rnd_408_Mag"], 14]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["srifle_DMR_01_F", 5, 2, 4, ["10Rnd_762x51_Mag"], 9]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["srifle_EBR_F", 5, 2, 4, ["20Rnd_762x51_Mag"], 9]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["srifle_GM6_F", 5, 2, 4, ["5Rnd_127x108_Mag"], 9]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["LMG_Zafir_F", 5, 2, 4, ["150Rnd_762x51_Box", "150Rnd_762x51_Box_Tracer"], 6]];
// non-CAST weapons
//drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["srifle_LRR_F", 50, 2, 4, ["7Rnd_408_Mag"], 9]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["LMG_Mk200_F", 10, 2, 4, ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], 6]];


// Weapons and ammo in the launchers box
drn_arr_AmmoDepotLaunchers = [];
// CSAT weapons
//drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["CAF_RPG7", 60, 3, 5, ["CAF_PG7V", "CAF_OG7"], 6]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["CAF_STRELA", 60, 3, 5, ["CAF_AA_ROCKET"], 6]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_RPG32_F", 50, 3, 5, ["RPG32_F", "RPG32_HE_F"], 6]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_O_Titan_F", 20, 1, 1, ["Titan_AA"], 3]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_O_Titan_short_F", 20, 1, 1, ["Titan_AP", "Titan_AT"], 3]];
// non-CSAT weapons
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_NLAW_F", 50, 3, 5, ["NLAW_F"], 6]];
//drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_I_Titan_F", 50, 1, 1, ["Titan_AA"], 3]];
//drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_I_Titan_short_F", 50, 1, 1, ["Titan_AP", "Titan_AT"], 3]];
//drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_B_Titan_F", 50, 1, 1, ["Titan_AA"], 3]];
//drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_B_Titan_short_F", 50, 1, 1, ["Titan_AP", "Titan_AT"], 3]];


// Weapons and ammo in the ordnance box
drn_arr_AmmoDepotOrdnance = [];
// General weapons
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, [objNull, 40, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "ClaymoreDirectionalMine_Remote_Mag", "APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "ATMine_Range_Mag", "APERSTripMine_Wire_Mag", "SLAMDirectionalMine_Wire_Mag", "Laserbatteries"], 20]];


// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
drn_arr_AmmoDepotVehicle = [];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["HandGrenade", "MiniGrenade", "HandGrenade_Stone"], 50]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["3Rnd_Smoke_Grenade_shell", "3Rnd_SmokeBlue_Grenade_shell", "3Rnd_SmokeGreen_Grenade_shell", "3Rnd_SmokeOrange_Grenade_shell", "3Rnd_SmokePurple_Grenade_shell", "3Rnd_SmokeRed_Grenade_shell", "3Rnd_SmokeYellow_Grenade_shell"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["3Rnd_UGL_FlareWhite_F", "3Rnd_UGL_FlareGreen_F", "3Rnd_UGL_FlareRed_F", "3Rnd_UGL_FlareYellow_F", "3Rnd_UGL_FlareCIR_F"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["ToolKit", 50, 10, 10, [], 0]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Medikit", 50, 10, 10, [], 0]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["FirstAidKit", 50, 50, 50, [], 0]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Binocular", 50, 25, 25, [], 0]];
a3e_arr_AmmoDepotVehicleBackpacks = ["O_UAV_01_backpack_F"];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-50)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

drn_arr_AmmoDepotItems = [];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["Laserdesignator", 5, 10, 10]];
if(!a3e_var_noNV) then {
	drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["NVGoggles", 15, 10, 10]];
};
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["Rangefinder", 15, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemCompass", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemGPS", 15, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemMap", 60, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemRadio", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemWatch", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["acc_flashlight", 60, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["acc_pointer_IR", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_acp", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_B", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_H", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_H_MG", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_L", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_M", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Aco", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Aco_smg", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_ACO_grn", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_ACO_grn_smg", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Arco", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Hamr", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Holosight", 10, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Holosight_smg", 10, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_MRCO", 40, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_SOS", 40, 10, 10]];
if(!a3e_var_noNV) then {
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_tws", 5, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_tws_mg", 5, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Nightstalker", 10, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_NVS", 10, 10, 10]];
};
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["O_UavTerminal", 20, 5, 5]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_DMS", 40, 5, 5]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Yorris", 20, 5, 5]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_LRPS", 40, 5, 5]];

// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.

drn_arr_CivilianCarWeapons = [];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hgun_P07_F", "16Rnd_9x21_Mag", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hgun_P07_snds_F", "30Rnd_9x21_Mag", 11]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hgun_Rook40_snds_F", "30Rnd_9x21_Mag", 9]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hgun_ACPC2_F", "9Rnd_45ACP_Mag", 12]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["CAF_AK47", "CAF_30RND_762x39_AK", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["CAF_AK74", "CAF_30RND_545x39_AK", 6]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["CAF_AK74GL", "CAF_30RND_545x39_AK", 7]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["CAF_PKM", "CAF_100RND_762x54_PKM", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["CAF_RPG7", "AT - CAF_PG7V", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["CAF_RPG7", "HE - CAF_OG7", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["SMG_02_ACO_F", "30Rnd_9x21_Mag", 12]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["CAF_RPK74", "CAF_75RND_545x39_RPK", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["MineDetector", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Medikit", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Toolkit", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Binocular", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, [objNull, "SatchelCharge_Remote_Mag", 2]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, [objNull, "HandGrenade", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, [objNull, "SmokeShell", 5]];


// Here is a list of scopes:
a3n_arr_Scopes = ["optic_Aco","optic_ACO_grn","optic_Arco","optic_Hamr","optic_MRCO","optic_Holosight"];
a3n_arr_Scopes_SMG = ["optic_Aco_smg","optic_Holosight_smg"];
a3n_arr_NightScopes = ["optic_NVS"];
a3n_arr_TWSScopes = ["optic_Nightstalker","optic_tws","optic_tws_mg"];


//format ["name", [ammunition], [suppressors], [optics]]
//[optics] doesn't contain everything that be attatched to the weapon, just the one's I thought sort of made sense given who might carry them.
//weapon arrays
a3n_arr_CSAT_Primary_Weapons = [];
a3n_arr_CSAT_Primary_Weapons set [0, ["arifle_Katiba_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["muzzle_snds_H"], ["optic_Aco", "optic_Hamr"]]];
a3n_arr_CSAT_Primary_Weapons set [1, ["arifle_Katiba_C_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["muzzle_snds_H"], ["optic_Aco", "optic_Hamr"]]];
a3n_arr_CSAT_Primary_Weapons set [2, ["arifle_Katiba_GL_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["muzzle_snds_H"], ["optic_Aco", "optic_Hamr"]]];
a3n_arr_CSAT_Primary_Weapons set [3, ["LMG_Zafir_F", ["150Rnd_762x51_Box", "150Rnd_762x51_Box_Tracer"], [], ["optic_Hamr"]]];
a3n_arr_CSAT_Primary_Weapons set [4, ["SMG_01_F", ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_tracer_green"], ["muzzle_snds_acp"], ["optic_Aco_smg"]]];
a3n_arr_CSAT_Primary_Weapons set [5, ["srifle_EBR_F", ["20Rnd_762x51_Mag"], ["muzzle_snds_B"], ["optic_Hamr", "optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3n_arr_CSAT_Primary_Weapons set [6, ["srifle_GM6_F", ["5Rnd_127x108_Mag"], [], ["optic_Hamr", "optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3n_arr_CSAT_Secondary_Weapons = [];
a3n_arr_CSAT_Secondary_Weapons set [0, ["hgun_Rook40_F", ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], ["muzzle_snds_L"], []]];
a3n_arr_CSAT_Launchers = [];
a3n_arr_CSAT_Launchers set [0, ["launch_O_Titan_F", ["Titan_AA"]]];
a3n_arr_CSAT_Launchers set [1, ["launch_O_Titan_short_F", ["Titan_AT", "Titan_AP"]]];
a3n_arr_CSAT_Launchers set [2, ["launch_RPG32_F", ["RPG32_F", "RPG32_HE_F"]]];
a3n_arr_AAF_Primary_Weapons = [];
a3n_arr_AAF_Primary_Weapons set [0, ["arifle_Mk20_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_AAF_Primary_Weapons set [1, ["arifle_Mk20C_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_AAF_Primary_Weapons set [2, ["arifle_Mk20_GL_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_AAF_Primary_Weapons set [3, ["arifle_SDAR_F", ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_AAF_Primary_Weapons set [4, ["LMG_Mk200_F", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], ["muzzle_snds_H_MG"], ["optic_Arco"]]];
a3n_arr_AAF_Primary_Weapons set [5, ["srifle_EBR_F", ["20Rnd_762x51_Mag"], ["muzzle_snds_B"], ["optic_Hamr", "optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3n_arr_AAF_Secondary_Weapons = [];
a3n_arr_AAF_Secondary_Weapons set [0, ["hgun_ACPC2_F", ["9Rnd_45ACP_Mag"], ["muzzle_snds_acp"], []]];
a3n_arr_AAF_Secondary_Weapons set [1, ["hgun_PDW2000_F", ["30Rnd_9x21_Mag", "16Rnd_9x21_Mag"], ["muzzle_snds_L"], []]];
a3n_arr_AAF_Launchers = [];
a3n_arr_AAF_Launchers set [0, ["launch_I_Titan_F", ["Titan_AA"]]];
a3n_arr_AAF_Launchers set [1, ["launch_I_Titan_short_F", ["Titan_AT", "Titan_AP"]]];
a3n_arr_AAF_Launchers set [2, ["launch_NLAW_F", ["NLAW_F"]]];
a3n_arr_NATO_Primary_Weapons = [];
a3n_arr_NATO_Primary_Weapons set [0, ["arifle_MX_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight"]]];
a3n_arr_NATO_Primary_Weapons set [1, ["arifle_MX_GL_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight"]]];
a3n_arr_NATO_Primary_Weapons set [2, ["arifle_MX_SW_F", ["100Rnd_65x39_caseless_mag_Tracer", "100Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Arco"]]];
a3n_arr_NATO_Primary_Weapons set [3, ["arifle_MXC_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight"]]];
a3n_arr_NATO_Primary_Weapons set [4, ["SMG_01_F", ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_tracer_green"], ["muzzle_snds_acp"],["optic_Holosight_smg"]]];
a3n_arr_NATO_Primary_Weapons set [5, ["arifle_MXM_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight", "optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3n_arr_NATO_Primary_Weapons set [6, ["srifle_LRR_F", ["7Rnd_408_Mag"], [], ["optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3n_arr_NATO_Secondary_Weapons = [];
a3n_arr_NATO_Secondary_Weapons set [0, ["hgun_P07_F", ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], ["muzzle_snds_L"], []]];
a3n_arr_NATO_Launchers = [];
a3n_arr_NATO_Launchers set [0, ["launch_B_Titan_F", ["Titan_AA"]]];
a3n_arr_NATO_Launchers set [1, ["launch_B_Titan_short_F", ["Titan_AT", "Titan_AP"]]];
a3n_arr_NATO_Launchers set [2, ["launch_NLAW_F", ["NLAW_F"]]];
a3n_arr_FIA_Primary_Weapons = [];
a3n_arr_FIA_Primary_Weapons set [0, ["arifle_TRG20_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_FIA_Primary_Weapons set [1, ["arifle_Mk20_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn"], "optic_Holosight"]];
a3n_arr_FIA_Primary_Weapons set [2, ["arifle_TRG21_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_FIA_Primary_Weapons set [3, ["arifle_SDAR_F", ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_FIA_Primary_Weapons set [4, ["arifle_TRG21_GL_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_FIA_Primary_Weapons set [5, ["arifle_Mk20_GL_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_FIA_Primary_Weapons set [6, ["LMG_Mk200_F", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], ["muzzle_snds_H_MG", "optic_Hamr", "optic_Arco"]]];
a3n_arr_FIA_Secondary_Weapons = [];
a3n_arr_FIA_Secondary_Weapons set [0, ["hgun_ACPC2_F", ["9Rnd_45ACP_Mag"], ["muzzle_snds_acp"], []]];
a3n_arr_FIA_Launchers = [];
a3n_arr_FIA_Launchers set [0, ["launch_B_Titan_F", ["Titan_AA"]]];
a3n_arr_FIA_Launchers set [1, ["launch_B_Titan_short_F", ["Titan_AT", "Titan_AP"]]];
a3n_arr_FIA_Launchers set [2, ["launch_NLAW_F", ["NLAW_F"]]];