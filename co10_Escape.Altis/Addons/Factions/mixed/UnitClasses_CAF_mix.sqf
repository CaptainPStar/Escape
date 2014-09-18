


switch (A3E_Location) do {
	case "Africa": {
		
		// Prison guards
		drn_arr_Escape_StartPositionGuardTypes = ["CAF_AG_AFR_P_AK47", "CAF_AG_AFR_P_AK74", "CAF_AG_AFR_P_GL", "CAF_AG_AFR_P_PKM"];
		
		// Inf types
		drn_arr_Escape_InfantryTypes_CAF = ["CAF_AG_AFR_P_AK47", "CAF_AG_AFR_P_AK74", "CAF_AG_AFR_P_GL", "CAF_AG_AFR_P_RPG", "CAF_AG_AFR_P_RPK74", "CAF_AG_AFR_P_SVD"];
		
		drn_arr_Escape_RoadBlock_MannedVehicleTypes = drn_arr_Escape_RoadBlock_MannedVehicleTypes + ["CAF_AG_AFR_P_Offroad_armed_01",  "CAF_AG_AFR_P_Offroad"];
		
		drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind + ["CAF_AG_AFR_P_Offroad_armed_01",  "CAF_AG_AFR_P_Offroad", "I_G_Offroad_01_armed_F", "I_static_AT_F"];
		
		drn_arr_ComCenParkedVehicles = drn_arr_ComCenParkedVehicles + ["CAF_AG_AFR_P_Offroad_armed_01",  "CAF_AG_AFR_P_Offroad", "CAF_AG_AFR_P_van_01"];
		
		drn_arr_Escape_AmmoDepot_ParkedVehicleClasses = drn_arr_Escape_AmmoDepot_ParkedVehicleClasses + ["CAF_AG_AFR_P_Offroad_armed_01",  "CAF_AG_AFR_P_Offroad", "CAF_AG_AFR_P_van_01"];
		
		};
		
	case "EastEuro": {
	
		// Prison guards
		drn_arr_Escape_StartPositionGuardTypes = ["CAF_AG_EEUR_R_AK47", "CAF_AG_EEUR_R_AK74", "CAF_AG_EEUR_R_GL", "CAF_AG_EEUR_R_PKM"];
		
		// Inf types
		drn_arr_Escape_InfantryTypes_CAF = ["CAF_AG_EEUR_R_AK47", "CAF_AG_EEUR_R_AK74", "CAF_AG_EEUR_R_GL", "CAF_AG_EEUR_R_RPG", "CAF_AG_EEUR_R_RPK74", "CAF_AG_EEUR_R_SVD"];
		
		drn_arr_Escape_RoadBlock_MannedVehicleTypes = drn_arr_Escape_RoadBlock_MannedVehicleTypes + ["CAF_AG_EEUR_R_Offroad_armed_01",  "CAF_AG_EEUR_R_Offroad"];
		
		drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind + ["CAF_AG_EEUR_R_Offroad_armed_01",  "CAF_AG_EEUR_R_Offroad", "I_G_Offroad_01_armed_F", "I_static_AT_F"];
		
		drn_arr_ComCenParkedVehicles = drn_arr_ComCenParkedVehicles + ["CAF_AG_EEUR_R_Offroad_armed_01",  "CAF_AG_EEUR_R_Offroad", "CAF_AG_EEUR_R_van_01"];
		
		drn_arr_Escape_AmmoDepot_ParkedVehicleClasses = drn_arr_Escape_AmmoDepot_ParkedVehicleClasses + ["CAF_AG_EEUR_R_Offroad_armed_01",  "CAF_AG_EEUR_R_Offroad", "CAF_AG_EEUR_R_van_01"];
		
		
		
	};
	case "Asia": {
		
			diag_log "Asia is the location and CAF mix is installed";

	};
	case "MidEast": {
		
		// Prison guards

		drn_arr_Escape_StartPositionGuardTypes = ["CAF_AG_ME_T_AK47", "CAF_AG_ME_T_AK74", "CAF_AG_ME_T_GL", "CAF_AG_ME_T_PKM"];
		
		// Inf types
		drn_arr_Escape_InfantryTypes_CAF = ["CAF_AG_ME_T_AK47", "CAF_AG_ME_T_AK74", "CAF_AG_ME_T_GL", "CAF_AG_ME_T_RPG", "CAF_AG_ME_T_RPK74", "CAF_AG_ME_T_SVD"];
		
		
		drn_arr_Escape_RoadBlock_MannedVehicleTypes = drn_arr_Escape_RoadBlock_MannedVehicleTypes + ["CAF_AG_ME_T_Offroad_armed_01",  "CAF_AG_ME_T_Offroad"];
		
		drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind + ["CAF_AG_ME_T_Offroad_armed_01",  "CAF_AG_ME_T_Offroad", "I_G_Offroad_01_armed_F", "I_static_AT_F"];
		
		drn_arr_ComCenParkedVehicles = drn_arr_ComCenParkedVehicles + ["CAF_AG_ME_T_Offroad_armed_01",  "CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_van_01"];
		
		drn_arr_Escape_AmmoDepot_ParkedVehicleClasses = drn_arr_Escape_AmmoDepot_ParkedVehicleClasses + ["CAF_AG_ME_T_Offroad_armed_01",  "CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_van_01"];
	};
	default {
		drn_arr_Escape_InfantryTypes_CAF = ["CAF_AG_EEUR_R_AK47", "CAF_AG_EEUR_R_AK74", "CAF_AG_EEUR_R_GL", "CAF_AG_EEUR_R_RPG", "CAF_AG_EEUR_R_RPK74", "CAF_AG_EEUR_R_SVD", "CAF_AG_ME_T_AK47", "CAF_AG_ME_T_AK74", "CAF_AG_ME_T_GL", "CAF_AG_ME_T_RPG", "CAF_AG_ME_T_RPK74", "CAF_AG_ME_T_SVD", "CAF_AG_AFR_P_AK47", "CAF_AG_AFR_P_AK74", "CAF_AG_AFR_P_GL", "CAF_AG_AFR_P_RPG", "CAF_AG_AFR_P_RPK74", "CAF_AG_AFR_P_SVD"];
		
		drn_arr_Escape_RoadBlock_MannedVehicleTypes = drn_arr_Escape_RoadBlock_MannedVehicleTypes + ["CAF_AG_EEUR_R_Offroad_armed_01",  "CAF_AG_EEUR_R_Offroad"];
		
		drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind + ["CAF_AG_EEUR_R_Offroad_armed_01",  "CAF_AG_EEUR_R_Offroad", "I_G_Offroad_01_armed_F", "I_static_AT_F"];
		
		drn_arr_ComCenParkedVehicles = drn_arr_ComCenParkedVehicles + ["CAF_AG_EEUR_R_Offroad_armed_01",  "CAF_AG_EEUR_R_Offroad", "CAF_AG_EEUR_R_van_01"];
		
		drn_arr_Escape_AmmoDepot_ParkedVehicleClasses = drn_arr_Escape_AmmoDepot_ParkedVehicleClasses + ["CAF_AG_EEUR_R_Offroad_armed_01",  "CAF_AG_EEUR_R_Offroad", "CAF_AG_EEUR_R_van_01"];
	};
		
};

//Add addon inf group to main array
A3E_addonsArrayINF set [(count A3E_addonsArrayINF), drn_arr_Escape_InfantryTypes_CAF];
		
//Ammo Depot boxes
		
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["CAF_AK47", 50, 4, 8, ["CAF_30RND_762x39_AK"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["CAF_AK74", 50, 4, 8, ["CAF_30RND_545x39_AK"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["CAF_AK74GL", 50, 4, 8, ["CAF_30RND_545x39_AK"], 8]];

drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["CAF_SVD", 50, 2, 4, ["CAF_10RND_762X54_SVD"], 14]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["CAF_PKM", 50, 2, 4, ["CAF_100RND_762x54_PKM"], 6]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["CAF_RPK74", 50, 2, 4, ["CAF_75RND_545x39_RPK"], 7]];

drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["CAF_STRELA", 60, 3, 5, ["CAF_AA_ROCKET"], 6]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_RPG32_F", 50, 3, 5, ["RPG32_F", "RPG32_HE_F"], 6]];
		