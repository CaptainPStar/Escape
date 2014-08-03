//SearchLeader

a3e_var_knownPositionHelperObject = "Land_HelipadEmpty_F";
a3e_var_knownPositionMinDistance = 100;


//Patrols
a3e_var_maxSearchRange = 1000;
a3e_var_investigationChance = 60;

//Debug

A3E_SystemLog = true;

//Artillery
a3e_var_artillery_units  = [arti_1,arti_2,arti_3,arti_4,arti_5,arti_6,arti_7,arti_8,arti_9,arti_10,arti_11,arti_12,arti_13,arti_14,arti_15,arti_16];
a3e_var_artilleryTimeThreshold = 120;
a3e_var_artillery_cooldown = 600;
a3e_var_artillery_rounds = 4;
a3e_var_artillery_dispersion = 80;
a3e_var_artillery_chance = 10;
a3e_var_artillery_chance_cooldown = 60;
a3e_var_artillery_fleeingDistance = 400;

//General variable initialization

A3E_var_MinEnemyGroupSize = 0;
A3E_var_MaxEnemyGroupSize = 0;
A3E_var_BannedPositions = [];
A3E_var_PlayerGroup = grpNull;




A3E_Debug = true; //Can be overwritten by parameters


//Settings
//Side and Faction of Player [Side,Faction]
       
A3E_Sides = [EAST, WEST, RESISTANCE];
A3E_SideStrings = ["EAST","WEST","GUER"];
A3E_PlayerSide = 1;
A3E_LocalSide = 2;
A3E_EnemySide = 0;


A3E_MaxAmbientAIGroups = 20;

A3E_TeamLeaders = [
["O_Soldier_TL_F"],//East
["B_soldier_TL_F"],//West
["I_Soldier_TL_F"]//Guer
];
A3E_GroupMembers = [
["O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AA_F", "O_Soldier_AR_F", "O_Soldier_AT_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_LAT_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F", "O_officer_F", "O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AR_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_LAT_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F", "O_officer_F", "O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AR_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F","O_soldier_UAV_F","O_Soldier_AAR_F", "O_support_AMG_F", "O_support_AMort_F", "O_Soldier_AAA_F", "O_Soldier_AAT_F", "O_support_GMG_F", "O_support_MG_F", "O_support_Mort_F"],//East
["B_soldier_F"],//West
["I_engineer_F", "I_medic_F", "I_medic_F", "I_medic_F", "I_Soldier_A_F", "I_Soldier_AA_F", "I_Soldier_AR_F", "I_Soldier_AT_F", "I_Soldier_exp_F", "I_soldier_F", "I_Soldier_GL_F", "I_Soldier_LAT_F", "I_Soldier_lite_F", "I_Soldier_M_F", "I_Soldier_repair_F", "I_officer_F", "I_engineer_F", "I_medic_F", "I_Soldier_A_F", "I_Soldier_AR_F", "I_Soldier_exp_F", "I_soldier_F", "I_Soldier_GL_F", "I_Soldier_LAT_F", "I_Soldier_lite_F", "I_Soldier_M_F", "I_Soldier_repair_F", "I_officer_F", "I_engineer_F", "I_medic_F", "I_Soldier_A_F", "I_Soldier_AR_F", "I_Soldier_exp_F", "I_soldier_F", "I_Soldier_GL_F", "I_Soldier_lite_F", "I_Soldier_M_F", "I_Soldier_repair_F","I_soldier_UAV_F","I_Soldier_AAR_F", "I_support_AMG_F", "I_support_AMort_F", "I_Soldier_AAA_F", "I_Soldier_AAT_F", "I_support_GMG_F", "I_support_MG_F", "I_support_Mort_F"]//Guer
];

A3E_RoadblockVehicles = [
[],//East
[],//West
[]//Guer
];

A3E_ExtractionHelicopters = [
"B_Heli_Transport_01_F"
];

//GlobalVariables (NO SETTINGS)
A3E_Players = []; //A list of the connected players
A3E_StartPos = [];  //The Startposition
A3E_HC_ID = 0;


A3E_TriggerMethod = 0; //### 0 : Chronos - 1 : Trigger per Area - 2 : Regions

//Spawning
A3E_MinSpawnCircleDistance = 800;
A3E_MaxSpawnCircleDistance = 2000;

//Creating Sides
if(isserver) then {
    createcenter (A3E_Sides select A3E_LocalSide);
    createcenter (A3E_Sides select A3E_EnemySide);
    (A3E_Sides select A3E_PlayerSide) setFriend [(A3E_Sides select A3E_LocalSide), 0];
    (A3E_Sides select A3E_PlayerSide) setFriend [(A3E_Sides select A3E_EnemySide), 0];
    (A3E_Sides select A3E_LocalSide) setFriend [(A3E_Sides select A3E_EnemySide), 1];
    (A3E_Sides select A3E_EnemySide) setFriend [(A3E_Sides select A3E_LocalSide), 1];
};

//RegionSettings and Vars
A3E_RegionSize = 1000;
A3E_RegionOverlap = 250;
A3E_RegionDeactivateOffset = 25;
A3E_RegionID = 0; //Incrementing number for regions

//0 Boolean (status),1 String(Marker),2 object (Region logic),3 Trg(Aktivation),4 Trg(Deaktivation),5 Array(ZoneMarker)
A3E_Regions = []; //Array holding all the regiondata

A3E_HelperObject = "Land_HelipadEmpty_F";
//AmbientInfantry
A3E_GroupsPerSqKm = 4;
A3E_AmbientSpawnDistance = 250;
A3E_AmbientGroupMembers = 2;


A3E_ReportingTime = 20; //Minimal reporting time
A3E_ReportingTimeRandom = 30; //Random reporting time addition

A3E_RoadblockProbability = 0.25;

A3E_HackTime = 30;

//Helper for landing choppers
A3E_HelperObject = "Land_HelipadEmpty_F";
