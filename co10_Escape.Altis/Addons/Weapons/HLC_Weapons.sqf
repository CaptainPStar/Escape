// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in the basic weapons box

if (isClass(configFile >> "cfgPatches" >> "hlcweapons_ar15")) then {
// AR-15 556
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_RU556", 40, 4, 8, ["hlc_30rnd_556x45_EPR", "hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_SPR"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_RU5562", 40, 4, 8, ["hlc_30rnd_556x45_EPR", "hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_SPR"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_Colt727", 40, 4, 8, ["hlc_30rnd_556x45_EPR", "hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_SPR"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_Colt727_GL", 40, 4, 8, ["hlc_30rnd_556x45_EPR", "hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_SPR"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_bcmjack", 40, 4, 8, ["hlc_30rnd_556x45_EPR", "hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_SPR"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_SAMR", 40, 4, 8, ["hlc_30rnd_556x45_EPR", "hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_SPR"], 8]];

// .300
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_Bushmaster300", 40, 4, 8, ["29rnd_300BLK_STANAG", "29rnd_300BLK_STANAG_T", "29rnd_300BLK_STANAG_S"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_vendimus", 40, 4, 8, ["29rnd_300BLK_STANAG", "29rnd_300BLK_STANAG_T", "29rnd_300BLK_STANAG_S"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_honeybadger", 40, 4, 8, ["29rnd_300BLK_STANAG", "29rnd_300BLK_STANAG_T", "29rnd_300BLK_STANAG_S"], 8]];

// Optics and attachments
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_muzzle_556NATO_KAC", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_muzzle_300blk_KAC", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_optic_LRT_m14", 40, 10, 10, [], 0]];

};


// AK Pack
if (isClass(configFile >> "cfgPatches" >> "hlcweapons_aks")) then {
// AK 74
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_ak74", 40, 4, 8, ["hlc_30Rnd_545x39_B_AK", "hlc_30Rnd_545x39_T_AK", "hlc_30Rnd_545x39_EP_AK", "hlc_45Rnd_545x39_t_rpk"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_aks74", 40, 4, 8, ["hlc_30Rnd_545x39_B_AK", "hlc_30Rnd_545x39_T_AK", "hlc_30Rnd_545x39_EP_AK", "hlc_45Rnd_545x39_t_rpk"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_aks74u", 40, 4, 8, ["hlc_30Rnd_545x39_B_AK", "hlc_30Rnd_545x39_T_AK", "hlc_30Rnd_545x39_EP_AK", "hlc_45Rnd_545x39_t_rpk"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_aks74_GL", 40, 4, 8, ["hlc_30Rnd_545x39_B_AK", "hlc_30Rnd_545x39_T_AK", "hlc_30Rnd_545x39_EP_AK", "hlc_45Rnd_545x39_t_rpk"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_ak12", 40, 4, 8, ["hlc_30Rnd_545x39_B_AK", "hlc_30Rnd_545x39_T_AK", "hlc_30Rnd_545x39_EP_AK", "hlc_45Rnd_545x39_t_rpk"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_aek971", 40, 4, 8, ["hlc_30Rnd_545x39_B_AK", "hlc_30Rnd_545x39_T_AK", "hlc_30Rnd_545x39_EP_AK", "hlc_45Rnd_545x39_t_rpk"], 8]];

// AK 47
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_ak47", 40, 4, 8, ["hlc_30Rnd_762x39_b_ak", "hlc_30Rnd_762x39_t_ak"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_akm", 40, 4, 8, ["hlc_30Rnd_762x39_b_ak", "hlc_30Rnd_762x39_t_ak"], 8]];

drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_rpk", 40, 4, 8, ["hlc_45Rnd_762x39_t_rpk", "hlc_45Rnd_762x39_m_rpk"], 8]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_akmgl", 40, 4, 8, ["hlc_30Rnd_762x39_b_ak", "hlc_30Rnd_762x39_t_ak"], 8]];

// Saiga 12k
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_saiga12k", 40, 4, 8, ["hlc_10rnd_12g_buck_S12", "hlc_10rnd_12g_slug_S12"], 8]];

// Optics and attachments
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["HLC_Optic_PSO1", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["HLC_Optic_1p29", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_optic_kobra", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_optic_goshawk", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_muzzle_545SUP_AK", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_muzzle_762SUP_AK", 40, 10, 10, [], 0]];

// HE and smoke rounds
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, [objNull, 50, 1, 1, ["hlc_VOG25_AK"], 25]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, [objNull, 50, 1, 1, ["hlc_GRD_White"], 25]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, [objNull, 50, 1, 1, ["hlc_GRD_red"], 25]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, [objNull, 50, 1, 1, ["hlc_GRD_green"], 25]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, [objNull, 50, 1, 1, ["hlc_GRD_blue"], 25]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, [objNull, 50, 1, 1, ["hlc_GRD_orange"], 25]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, [objNull, 50, 1, 1, ["hlc_GRD_purple"], 25]];
};

// Weapons and ammo in the spesual weapons box


// M60E4
if (isClass(configFile >> "cfgPatches" >> "hlcweapons_m60e4")) then {
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_lmg_M60", 40, 4, 8, ["hlc_100Rnd_762x51_B_M60E4", "hlc_100Rnd_762x51_T_M60E4", "hlc_100Rnd_762x51_M_M60E4"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_lmg_M60E4", 40, 4, 8, ["hlc_100Rnd_762x51_B_M60E4", "hlc_100Rnd_762x51_T_M60E4", "hlc_100Rnd_762x51_M_M60E4"], 8]];
};

// Battle Rifles

if (isClass(configFile >> "cfgPatches" >> "hlcweapons_falpocalypse")) then {
// Fal
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_l1a1slr", 40, 4, 8, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_20Rnd_762x51_S_fal", "hlc_50Rnd_762x51_M_FAL"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_SLR", 40, 4, 8, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_20Rnd_762x51_S_fal", "hlc_50Rnd_762x51_M_FAL"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_STG58F", 40, 4, 8, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_20Rnd_762x51_S_fal", "hlc_50Rnd_762x51_M_FAL"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_FAL5061", 40, 4, 8, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_20Rnd_762x51_S_fal", "hlc_50Rnd_762x51_M_FAL"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_c1A1", 40, 4, 8, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_20Rnd_762x51_S_fal", "hlc_50Rnd_762x51_M_FAL"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_LAR", 40, 4, 8, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_20Rnd_762x51_S_fal", "hlc_50Rnd_762x51_M_FAL"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_SLRchopmod", 40, 4, 8, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_20Rnd_762x51_S_fal", "hlc_50Rnd_762x51_M_FAL"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_falosw", 40, 4, 8, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_20Rnd_762x51_S_fal", "hlc_50Rnd_762x51_M_FAL"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_osw_GL", 40, 4, 8, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_20Rnd_762x51_S_fal", "hlc_50Rnd_762x51_M_FAL"], 8]];


// Optics and attachments
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_optic_PVS4FAL", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_optic_suit", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_muzzle_snds_fal", 40, 10, 10, [], 0]];

};

if (isClass(configFile >> "cfgPatches" >> "hlcweapons_g3")) then {
// G3
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_g3sg1", 40, 4, 8, ["hlc_20Rnd_762x51_B_G3", "hlc_20Rnd_762x51_T_G3", "hlc_50Rnd_762x51_M_G3"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_psg1", 40, 4, 8, ["hlc_20Rnd_762x51_B_G3", "hlc_20Rnd_762x51_T_G3", "hlc_50Rnd_762x51_M_G3"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_g3a3", 40, 4, 8, ["hlc_20Rnd_762x51_B_G3", "hlc_20Rnd_762x51_T_G3", "hlc_50Rnd_762x51_M_G3"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_g3ka4", 40, 4, 8, ["hlc_20Rnd_762x51_B_G3", "hlc_20Rnd_762x51_T_G3", "hlc_50Rnd_762x51_M_G3"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_g3ka4_GL", 40, 4, 8, ["hlc_20Rnd_762x51_B_G3", "hlc_20Rnd_762x51_T_G3", "hlc_50Rnd_762x51_M_G3"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_hk51", 40, 4, 8, ["hlc_20Rnd_762x51_B_G3", "hlc_20Rnd_762x51_T_G3", "hlc_50Rnd_762x51_M_G3"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_hk53", 40, 4, 8, ["hlc_20Rnd_762x51_B_G3", "hlc_20Rnd_762x51_T_G3", "hlc_50Rnd_762x51_M_G3"], 8]];

// Optics and attachments
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_muzzle_snds_HK33", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_muzzle_snds_G3", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["HLC_Optic_ZFSG1", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_optic_accupoint_g3", 40, 10, 10, [], 0]];

};

if (isClass(configFile >> "cfgPatches" >> "hlcweapons_m14")) then {
// M14
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_M14", 40, 4, 8, ["hlc_50Rnd_762x51_B_M14","hlc_20Rnd_762x51_T_M14","hlc_20Rnd_762x51_B_M14","hlc_20Rnd_762x51_S_M14"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_M21", 40, 4, 8, ["hlc_50Rnd_762x51_B_M14","hlc_20Rnd_762x51_T_M14","hlc_20Rnd_762x51_B_M14","hlc_20Rnd_762x51_S_M14"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_M14DMR", 40, 4, 8, ["hlc_50Rnd_762x51_B_M14","hlc_20Rnd_762x51_T_M14","hlc_20Rnd_762x51_B_M14","hlc_20Rnd_762x51_S_M14"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_rifle_M14sopmod", 40, 4, 8, ["hlc_50Rnd_762x51_B_M14","hlc_20Rnd_762x51_T_M14","hlc_20Rnd_762x51_B_M14","hlc_20Rnd_762x51_S_M14"], 8]];

// Optics and attachments
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_muzzle_snds_M14", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_optic_artel_m14", 40, 10, 10, [], 0]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["hlc_optic_LRT_m14", 40, 10, 10, [], 0]];

};













