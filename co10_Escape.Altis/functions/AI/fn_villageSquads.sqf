

_spawnHouse = _this select 0;
_playr = _this select 1;
//_i = _this select 2;
	//hintsilent format ["spawning here: \n %1", _spawnHouse];
_inflist = [
"I_Soldier_AR_F", 
"I_Soldier_GL_F", 
"I_Soldier_F", 
"I_Soldier_lite_F", 
"I_soldier_exp_F", 
"I_engineer_F"
];

_civ_clothes = ["U_C_Commoner1_1",
                "U_C_Commoner1_2",
                "U_C_Commoner1_3",				
                "U_C_Poloshirt_blue",
                "U_C_Poloshirt_burgundy",
                "U_C_Poloshirt_redwhite",
                "U_C_Poloshirt_salmon",
                "U_C_Poloshirt_stripped",
                "U_C_Poloshirt_tricolour",
				"U_NikosBody",
				"U_OrestesBody",				
				"U_C_Poor_1",
				"U_C_Poor_2",
				"U_C_Commoner_shorts",
				"U_OG_Guerilla2_1"
				];
                
_civ_hats    = ["H_Cap_red", "H_Cap_blu", "H_Cap_brn_SERO","H_Bandanna_surfer","H_Hat_blue","H_Cap_oli","H_Cap_blk_CMMG"];

_vests       = ["V_Rangemaster_belt",
                "V_TacVest_brn",
                "V_BandollierB_cbr"];
_armedcivs = false;
_menCount = 0;
_men = _spawnHouse nearEntities ["Man", 80];
_menCount = count _men;
	//if (_menCount > 5) exitWith {};
	
// Civ or army ? 
if (random 100 > 70) then {_armedcivs = true;};


		//hintsilent "Spawning allowed";
			//// SQUAD 1
				_sqname = creategroup EAST;
				
				/////////////// inf 1 //////////////////////
				_inftype = _inflist select (floor (random (count _inflist)));
				_inf1 = _sqname createUnit [_inftype, _spawnHouse, [], 0, "FORM"];				
				_inf1 call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
				_inf1 setRank "CAPTAIN";
				_inf1 addItem "FirstAidKit";
				if (_armedcivs) then {
						removeUniform _inf1;
						_cloth_item = _civ_clothes call BIS_fnc_selectRandom;
						_inf1 forceAddUniform _cloth_item;
						_hat_item = _civ_hats call BIS_fnc_selectRandom;
						_inf1 addHeadgear _hat_item;
				};
				
				_inf1 addEventHandler ["killed", {
									
					infArray = infArray - [_this select 0];
					if (infNo > 0) then {
					infNo = infNo - 1;
					};
					_unit = _this select 0;
					_unitPos = getPos _unit;
					_killer = _this select 1;
					
					}];
				infArray set [infNo,_inf1];	
				infNo = infNo + 1; 
				//_inf setGroupId ["BRAVO"];
				_sqname setspeedmode "LIMITED";
				_sqname setBehaviour "AWARE";
				//diag_log "_+_+_+_+_+_+_ Using this marker for UPS _+_+_+_+_+_+_";
				//diag_log (str _playr + "midvillage");
				0 = [_inf1,(str _playr + "midvillage")] execVM "Scripts\UPS.sqf";
				
				/////////////// inf 2 //////////////////////
				_inftype = _inflist select (floor (random (count _inflist)));
				_inf2 = _sqname createUnit [_inftype, _spawnHouse, [], 0, "FORM"];
				_inf2 call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
				_inf2 addItem "FirstAidKit";
				
				if (_armedcivs) then {
						removeUniform _inf2;
						_cloth_item = _civ_clothes call BIS_fnc_selectRandom;
						_inf2 forceAddUniform _cloth_item;
						_hat_item = _civ_hats call BIS_fnc_selectRandom;
						_inf2 addHeadgear _hat_item;
				};
				_inf2 addEventHandler ["killed", {
										
					infArray = infArray - [_this select 0];
					if (infNo > 0) then {
					infNo = infNo - 1;
					};
					_unit = _this select 0;
					_unitPos = getPos _unit;
					_killer = _this select 1;
					
					_markers = allMapMarkers;
					{		
					if (((getMarkerPos _x) distance (getPos _unit)) < 5) then {
						deleteMarker _x;
							};
					} forEach _markers;
					
					//_marker = createMarker [str _playr + "death" + str infNo, _unitPos];
					//_marker setMarkerType "mil_objective";
					//_marker setMarkerColor "ColorRed";
					//_marker setMarkerSize [0.6,0.6];
					
					}];
				infArray set [infNo,_inf2];	
				infNo = infNo + 1;
				
				/////////////// inf 3 //////////////////////
				_rndm = (floor(random(100)));
			if (_rndm > 70) then {
				_inftype = _inflist select (floor (random (count _inflist)));
				_inf3 = _sqname createUnit [_inftype, _spawnHouse, [], 0, "FORM"];
				_inf3 call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
				_inf3 addItem "FirstAidKit";

				if (_armedcivs) then {
						removeUniform _inf3;
						_cloth_item = _civ_clothes call BIS_fnc_selectRandom;
						_inf3 forceAddUniform _cloth_item;
						_hat_item = _civ_hats call BIS_fnc_selectRandom;
						_inf3 addHeadgear _hat_item;
				};
				_inf3 addEventHandler ["killed", {
										
					infArray = infArray - [_this select 0];
					if (infNo > 0) then {
					infNo = infNo - 1;
					};
					_unit = _this select 0;
					_unitPos = getPos _unit;
					_killer = _this select 1;
					
					_markers = allMapMarkers;
					{		
					if (((getMarkerPos _x) distance (getPos _unit)) < 5) then {
						deleteMarker _x;
							};
					} forEach _markers;
					
					//_marker = createMarker [str _playr + "death" + str infNo, _unitPos];
					//_marker setMarkerType "mil_objective";
					//_marker setMarkerColor "ColorRed";
					//_marker setMarkerSize [0.6,0.6];
					
					}];
					infArray set [infNo,_inf3];	
					infNo = infNo + 1;
			};
				
				
				/////////////// inf 4 //////////////////////
				_rndm = (floor(random(100)));
			if (_rndm > 80) then {
				_inftype = _inflist select (floor (random (count _inflist)));
				_inf4 = _sqname createUnit [_inftype, _spawnHouse, [], 0, "FORM"];
				_inf4 call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
				_inf4 addItem "FirstAidKit";

				if (_armedcivs) then {
						removeUniform _inf4;
						_cloth_item = _civ_clothes call BIS_fnc_selectRandom;
						_inf4 forceAddUniform _cloth_item;
						_hat_item = _civ_hats call BIS_fnc_selectRandom;
						_inf4 addHeadgear _hat_item;
				};
				_inf4 addEventHandler ["killed", {
										
					infArray = infArray - [_this select 0];
					if (infNo > 0) then {
					infNo = infNo - 1;
					};
					_unit = _this select 0;
					_unitPos = getPos _unit;
					_killer = _this select 1;
					
					_markers = allMapMarkers;
					{		
					if (((getMarkerPos _x) distance (getPos _unit)) < 5) then {
						deleteMarker _x;
							};
					} forEach _markers;
					
					//_marker = createMarker [str _playr + "death" + str infNo, _unitPos];
					//_marker setMarkerType "mil_objective";
					//_marker setMarkerColor "ColorRed";
					//_marker setMarkerSize [0.6,0.6];
					
					}];
				infArray set [infNo,_inf4];	
				infNo = infNo + 1;
			};	
		
				/////////////// inf 5 //////////////////////
				_rndm = (floor(random(100)));
			if (_rndm > 80) then {
				_inftype = _inflist select (floor (random (count _inflist)));
				_inf5 = _sqname createUnit [_inftype, _spawnHouse, [], 0, "FORM"];
				_inf5 call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
				_inf5 addItem "FirstAidKit";

				if (_armedcivs) then {
						removeUniform _inf5;
						_cloth_item = _civ_clothes call BIS_fnc_selectRandom;
						_inf5 forceAddUniform _cloth_item;
						_hat_item = _civ_hats call BIS_fnc_selectRandom;
						_inf5 addHeadgear _hat_item;
				};
				_inf5 addEventHandler ["killed", {
										
					infArray = infArray - [_this select 0];
					if (infNo > 0) then {
					infNo = infNo - 1;
					};
					_unit = _this select 0;
					_unitPos = getPos _unit;
					_killer = _this select 1;
					
					_markers = allMapMarkers;
					{		
					if (((getMarkerPos _x) distance (getPos _unit)) < 5) then {
						deleteMarker _x;
							};
					} forEach _markers;
					
					//_marker = createMarker [str _playr + "death" + str infNo, _unitPos];
					//_marker setMarkerType "mil_objective";
					//_marker setMarkerColor "ColorRed";
					//_marker setMarkerSize [0.6,0.6];
					
					}];
				infArray set [infNo,_inf5];	
				infNo = infNo + 1;
			};	

				/////////////// inf 6 //////////////////////
				_rndm = (floor(random(100)));
			if (_rndm > 80) then {
				_inftype = _inflist select (floor (random (count _inflist)));
				_inf6 = _sqname createUnit [_inftype, _spawnHouse, [], 0, "FORM"];
				_inf6 call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
				_inf6 addItem "FirstAidKit";

				if (_armedcivs) then {
						removeUniform _inf6;
						_cloth_item = _civ_clothes call BIS_fnc_selectRandom;
						_inf6 forceAddUniform _cloth_item;
						_hat_item = _civ_hats call BIS_fnc_selectRandom;
						_inf6 addHeadgear _hat_item;
				};
				_inf6 addEventHandler ["killed", {
										
					infArray = infArray - [_this select 0];
					if (infNo > 0) then {
					infNo = infNo - 1;
					};
					_unit = _this select 0;
					_unitPos = getPos _unit;
					_killer = _this select 1;
					
					_markers = allMapMarkers;
					{		
					if (((getMarkerPos _x) distance (getPos _unit)) < 5) then {
						deleteMarker _x;
							};
					} forEach _markers;
					
					//_marker = createMarker [str _playr + "death" + str infNo, _unitPos];
					//_marker setMarkerType "mil_objective";
					//_marker setMarkerColor "ColorRed";
					//_marker setMarkerSize [0.6,0.6];
					
					}];
				infArray set [infNo,_inf6];	
				infNo = infNo + 1;
			};	
			
				/////////////// inf 7 //////////////////////
				_rndm = (floor(random(100)));
			if (_rndm > 80) then {
				_inftype = _inflist select (floor (random (count _inflist)));
				_inf7 = _sqname createUnit [_inftype, _spawnHouse, [], 0, "FORM"];
				_inf7 call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
				_inf7 addItem "FirstAidKit";

				if (_armedcivs) then {
						removeUniform _inf7;
						_cloth_item = _civ_clothes call BIS_fnc_selectRandom;
						_inf7 forceAddUniform _cloth_item;
						_hat_item = _civ_hats call BIS_fnc_selectRandom;
						_inf7 addHeadgear _hat_item;
				};
				_inf7 addEventHandler ["killed", {
										
					infArray = infArray - [_this select 0];
					if (infNo > 0) then {
					infNo = infNo - 1;
					};
					_unit = _this select 0;
					_unitPos = getPos _unit;
					_killer = _this select 1;
					
					_markers = allMapMarkers;
					{		
					if (((getMarkerPos _x) distance (getPos _unit)) < 5) then {
						deleteMarker _x;
							};
					} forEach _markers;
					
					//_marker = createMarker [str _playr + "death" + str infNo, _unitPos];
					//_marker setMarkerType "mil_objective";
					//_marker setMarkerColor "ColorRed";
					//_marker setMarkerSize [0.6,0.6];
					
					}];
				infArray set [infNo,_inf7];	
				infNo = infNo + 1;
			};	
			
				/////////////// inf 8 //////////////////////
				_rndm = (floor(random(100)));
			if (_rndm > 80) then {
				_inftype = _inflist select (floor (random (count _inflist)));
				_inf8 = _sqname createUnit [_inftype, _spawnHouse, [], 0, "FORM"];
				_inf8 call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
				_inf8 addItem "FirstAidKit";

				if (_armedcivs) then {
						removeUniform _inf8;
						_cloth_item = _civ_clothes call BIS_fnc_selectRandom;
						_inf8 forceAddUniform _cloth_item;
						_hat_item = _civ_hats call BIS_fnc_selectRandom;
						_inf8 addHeadgear _hat_item;
				};
				_inf8 addEventHandler ["killed", {
										
					infArray = infArray - [_this select 0];
					if (infNo > 0) then {
					infNo = infNo - 1;
					};
					_unit = _this select 0;
					_unitPos = getPos _unit;
					_killer = _this select 1;
					
					_markers = allMapMarkers;
					{		
					if (((getMarkerPos _x) distance (getPos _unit)) < 5) then {
						deleteMarker _x;
							};
					} forEach _markers;
					
					//_marker = createMarker [str _playr + "death" + str infNo, _unitPos];
					//_marker setMarkerType "mil_objective";
					//_marker setMarkerColor "ColorRed";
					//_marker setMarkerSize [0.6,0.6];
					
					}];
				infArray set [infNo,_inf8];	
				infNo = infNo + 1;
			};	
			
//hintsilent "Villagesquad spawned";
//diag_log "Vilagesquad spawned";


