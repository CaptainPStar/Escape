    private ["_middlePos", "_staticWeaponClasses", "_parkedVehicleClasses"];
    private ["_object", "_pos", "_marker", "_instanceNo", "_randomNo", "_gun", "_angle", "_car"];
    
    _middlePos = _this select 0;
    _staticWeaponClasses = _this select 1;
    _parkedVehicleClasses = _this select 2;
    
    if (isNil "drn_BuildAmmoDepot_MarkerInstanceNo") then {
        drn_BuildAmmoDepot_MarkerInstanceNo = 0;
    }
    else {
        drn_BuildAmmoDepot_MarkerInstanceNo = drn_BuildAmmoDepot_MarkerInstanceNo + 1;
    };
    _instanceNo = drn_BuildAmmoDepot_MarkerInstanceNo;

_buildingType = floor(random 3);
//_buildingType = 1;
_rotateDir = 0;
_units = [];
_vehPos = 10;
diag_log "---_buildingtype---";
diag_log _buildingType;

switch (_buildingType) do {
    case 0: 
	{
		_vehPos = 10;
		
		// Call Object Mapper
		0 = [_middlePos, _rotateDir, call (compile (preprocessFileLineNumbers "Structures\AmmoDepot.sqf"))] call BIS_fnc_ObjectsMapper;
		
		
		// Static HMG 1
		_dir = 315;
		_pos = [(_middlePos select 0) - 8, (_middlePos select 1) + 8, 0];
		_side = EAST;
		_result = [_pos, _dir, "O_HMG_01_high_F", _side] call BIS_fnc_spawnVehicle;
		_vehicle = _result select 0;
		_crew = _result select 1;
		_group = _result select 2;
    
		_units = _units + [_vehicle];
		_units = _units + _crew;
		
		{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach (_result select 1);
		
		// Static HMG 2
		_dir = 125;
		_pos = [(_middlePos select 0) + 8, (_middlePos select 1) - 8, 0];
		_side = EAST;
		_result = [_pos, _dir, "O_HMG_01_high_F", _side] call BIS_fnc_spawnVehicle;
		_vehicle = _result select 0;
		_crew = _result select 1;
		_group = _result select 2;
    
		_units = _units + [_vehicle];
		_units = _units + _crew;
		
		{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach (_result select 1);
		
		
	};
    case 1: 
	{		
		_vehPos = 10;
		
		// Call Object Mapper
		0 = [_middlePos, _rotateDir, call (compile (preprocessFileLineNumbers "Structures\AmmoDepot_2.sqf"))] call BIS_fnc_ObjectsMapper;
		
		// Static HMG 1
		_dir = 315;
		_pos = [(_middlePos select 0) - 1.2, (_middlePos select 1) + 2, 1.9];
		_side = EAST;
		_result = [_pos, _dir, "O_HMG_01_high_F", _side] call BIS_fnc_spawnVehicle;
		_vehicle = _result select 0;
		_crew = _result select 1;
		_group = _result select 2;
    
		_units = _units + [_vehicle];
		_units = _units + _crew;
		
		{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach (_result select 1);
		
		// Static HMG 2
		_dir = 125;
		_pos = [(_middlePos select 0) + 2, (_middlePos select 1) - 2.4, 1.9];
		_side = EAST;
		_result = [_pos, _dir, "O_HMG_01_high_F", _side] call BIS_fnc_spawnVehicle;
		_vehicle = _result select 0;
		_crew = _result select 1;
		_group = _result select 2;
    
		_units = _units + [_vehicle];
		_units = _units + _crew;
		
		{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach (_result select 1);
		
		_vehPos = 10;
		
	};
	case 2: 
	{
		_vehPos = 10;
		
		// Call Object Mapper
		0 = [_middlePos, _rotateDir, call (compile (preprocessFileLineNumbers "Structures\AmmoDepot_3.sqf"))] call BIS_fnc_ObjectsMapper;
		
		// Static HMG 1
		_dir = 35;
		_pos = [(_middlePos select 0) + 4.6, (_middlePos select 1) + 9, 0];
		_side = EAST;
		_result = [_pos, _dir, "O_HMG_01_high_F", _side] call BIS_fnc_spawnVehicle;
		_vehicle = _result select 0;
		_crew = _result select 1;
		_group = _result select 2;
    
		_units = _units + [_vehicle];
		_units = _units + _crew;
		
		{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach (_result select 1);
		
		// Static HMG 2
		_dir = 313;
		_pos = [(_middlePos select 0) - 6, (_middlePos select 1) + 9, 0];
		_side = EAST;
		_result = [_pos, _dir, "O_HMG_01_high_F", _side] call BIS_fnc_spawnVehicle;
		_vehicle = _result select 0;
		_crew = _result select 1;
		_group = _result select 2;
    
		_units = _units + [_vehicle];
		_units = _units + _crew;
		
		{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach (_result select 1);

		
	};
};
    

    
    // Cars
    
    if (random 10 > 1 && count _parkedVehicleClasses > 0) then {
        _car = _parkedVehicleClasses select floor random count _parkedVehicleClasses;
    }
    else {
        _car = "";
    };
    
    if (_car != "") then {
        _randomNo = random 4;
        _pos = [(_middlePos select 0) + _vehPos, (_middlePos select 1), 0];
        _angle = 45;
        if ((random 100) > 50) then {_angle = 0;} else {_angle = 180;};
        
        if (_randomNo > 2) then {
            _pos = [(_middlePos select 0) - _vehPos, (_middlePos select 1), 0];
            if ((random 100) > 50) then {_angle = 0;} else {_angle = 180;};
        };
        if (_randomNo > 3) then {
            _pos = [(_middlePos select 0), (_middlePos select 1) + _vehPos, 0];
            if ((random 100) > 50) then {_angle = 90;} else {_angle = 270;};
        };
        
        //_object = _car createVehicle _pos;
        _object = createVehicle [_car, _pos, [], 0, "NONE"];
        _object setPos _pos;
        _object setDir _angle;
    };
 /*   
	// Statics
    

        _gun = _staticWeaponClasses select floor random count _staticWeaponClasses;
        
        _randomNo = random 100;
        _pos = [(_middlePos select 0) + 11, (_middlePos select 1) + 11, 0];
        _angle = 45;
 
        _object = createVehicle [_gun, _pos, [], 0, "NONE"];
        _object setPos _pos;
        _object setDir _angle;
		
        if (_randomNo > 25) then {
            _pos = [(_middlePos select 0) + 11, (_middlePos select 1) - 11, 0];
            _angle = 135
        };
        if (_randomNo > 50) then {
            _pos = [(_middlePos select 0) - 11, (_middlePos select 1) - 11, 0];
            _angle = 225
        };
        if (_randomNo > 75) then {
            _pos = [(_middlePos select 0) - 11, (_middlePos select 1) + 11, 0];
            _angle = 315
        };
        

        _object = createVehicle [_gun, _pos, [], 0, "NONE"];
        _object setPos _pos;
        _object setDir _angle;
    };
*/	
    // Weapons
    
    private ["_weapons", "_weaponMagazines", "_box", "_weaponCount"];

    // Basic Weapon Box
    
    _weapons = [];
    _weaponMagazines = [];
    
    for "_i" from 0 to (count drn_arr_AmmoDepotBasicWeapons - 1) do {
        private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
        
        _handGunItem = drn_arr_AmmoDepotBasicWeapons select _i;
        
        _weaponClassName = _handGunItem select 0;
        _probabilityOfPrecence = _handGunItem select 1;
        _minCount = _handGunItem select 2;
        _maxCount = _handGunItem select 3;
        _magazines = _handGunItem select 4;
        _magazinesPerWeapon = _handGunItem select 5;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _weaponCount = floor (_minCount + random (_maxCount - _minCount));
            _weapons set [count _weapons, [_weaponClassName, _weaponCount]];
            
            for "_j" from 0 to (count _magazines) - 1 do {
                _weaponMagazines set [count _weaponMagazines, [_magazines select _j, _weaponCount * _magazinesPerWeapon]];
            };
        };
    };
    
    if (count _weapons > 0) then {
        //_box = "Box_East_Wps_F" createVehicle [(_middlePos select 0) - 3, (_middlePos select 1) + 0, 0];
        _box = createVehicle ["Box_East_Wps_F", [(_middlePos select 0) - 3, (_middlePos select 1) + 0, 0.2], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
        {
            _box addWeaponCargoGlobal _x;
        } foreach _weapons;
        
        {
            _box addMagazineCargoGlobal _x;
        } foreach _weaponMagazines;
    };

    // Special Weapon Box
    
    _weapons = [];
    _weaponMagazines = [];
    
    for "_i" from 0 to (count drn_arr_AmmoDepotSpecialWeapons - 1) do {
        private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
        
        _handGunItem = drn_arr_AmmoDepotSpecialWeapons select _i;
        
        _weaponClassName = _handGunItem select 0;
        _probabilityOfPrecence = _handGunItem select 1;
        _minCount = _handGunItem select 2;
        _maxCount = _handGunItem select 3;
        _magazines = _handGunItem select 4;
        _magazinesPerWeapon = _handGunItem select 5;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _weaponCount = floor (_minCount + random (_maxCount - _minCount));
            _weapons set [count _weapons, [_weaponClassName, _weaponCount]];
            
            for "_j" from 0 to (count _magazines) - 1 do {
                _weaponMagazines set [count _weaponMagazines, [_magazines select _j, _weaponCount * _magazinesPerWeapon]];
            };
        };
    };
    
    if (count _weapons > 0) then {
        //_box = "Box_East_WpsLaunch_F" createVehicle [(_middlePos select 0) + 3, (_middlePos select 1) + 0, 0];
        _box = createVehicle ["Box_East_WpsLaunch_F", [(_middlePos select 0) + 3, (_middlePos select 1) + 0, 0.2], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
        {
            _box addWeaponCargoGlobal _x;
        } foreach _weapons;
        
        {
            _box addMagazineCargoGlobal _x;
        } foreach _weaponMagazines;
    };

    // Ordnance
    
    _weapons = [];
    _weaponMagazines = [];
    
    for "_i" from 0 to (count drn_arr_AmmoDepotOrdnance - 1) do {
        private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
        
        _handGunItem = drn_arr_AmmoDepotOrdnance select _i;
        
        _weaponClassName = _handGunItem select 0;
        _probabilityOfPrecence = _handGunItem select 1;
        _minCount = _handGunItem select 2;
        _maxCount = _handGunItem select 3;
        _magazines = _handGunItem select 4;
        _magazinesPerWeapon = _handGunItem select 5;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _weaponCount = floor (_minCount + random (_maxCount - _minCount));
            _weapons set [count _weapons, [_weaponClassName, _weaponCount]];
            
            for "_j" from 0 to (count _magazines) - 1 do {
                _weaponMagazines set [count _weaponMagazines, [_magazines select _j, _weaponCount * _magazinesPerWeapon]];
            };
        };
    };
    
    if (count _weapons > 0) then {
        //_box = "Box_East_WpsSpecial_F" createVehicle [(_middlePos select 0) + 0, (_middlePos select 1) - 3, 0];
        _box = createVehicle ["Box_East_WpsSpecial_F", [(_middlePos select 0) + 0, (_middlePos select 1) - 3, 0.2], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
        {
            _box addWeaponCargoGlobal _x;
        } foreach _weapons;
        
        {
            _box addMagazineCargoGlobal _x;
        } foreach _weaponMagazines;
    };
    
    // Vehicle
    
    _weapons = [];
    _weaponMagazines = [];
    
    for "_i" from 0 to (count drn_arr_AmmoDepotVehicle - 1) do {
        private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
        
        _handGunItem = drn_arr_AmmoDepotVehicle select _i;
        
        _weaponClassName = _handGunItem select 0;
        _probabilityOfPrecence = _handGunItem select 1;
        _minCount = _handGunItem select 2;
        _maxCount = _handGunItem select 3;
        _magazines = _handGunItem select 4;
        _magazinesPerWeapon = _handGunItem select 5;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _weaponCount = floor (_minCount + random (_maxCount - _minCount));
            _weapons set [count _weapons, [_weaponClassName, _weaponCount]];
            
            for "_j" from 0 to (count _magazines) - 1 do {
                _weaponMagazines set [count _weaponMagazines, [_magazines select _j, _weaponCount * _magazinesPerWeapon]];
            };
        };
    };
    
    if (count _weapons > 0) then {
        //_box = "Box_NATO_AmmoVeh_F" createVehicle [(_middlePos select 0) + 0, (_middlePos select 1) + 0, 0];
        _box = createVehicle ["Box_NATO_AmmoVeh_F", [(_middlePos select 0) + 0, (_middlePos select 1) + 0, 0.2], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
        {
            _box addWeaponCargoGlobal _x;
        } foreach _weapons;
        
        {
            _box addMagazineCargoGlobal _x;
        } foreach _weaponMagazines;
		{
            _box addBackpackCargoGlobal [_x,4];
        } foreach a3e_arr_AmmoDepotVehicleBackpacks;
    };
    
    // Items

    _weapons = [];
    
    for "_i" from 0 to (count drn_arr_AmmoDepotItems - 1) do {
        private ["_item", "_itemClassName", "_probabilityOfPrecence", "_minCount", "_maxCount"];
        
        _item = drn_arr_AmmoDepotItems select _i;
        
        _itemClassName = _item select 0;
        _probabilityOfPrecence = _item select 1;
        _minCount = _item select 2;
        _maxCount = _item select 3;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _itemCount = floor (_minCount + random (_maxCount - _minCount));
            _weapons set [count _weapons, [_itemClassName, _itemCount]];
        };
    };
    
    if (count _weapons > 0) then {
        //_box = "Box_East_Wps_F" createVehicle [(_middlePos select 0) + 0, (_middlePos select 1) + 3, 0];
        _box = createVehicle ["Box_East_Wps_F", [(_middlePos select 0) + 3, (_middlePos select 1) - 3, 0.2], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
        {
            _box addItemCargoGlobal _x;
        } foreach _weapons;
    };

    // Launchers
    
    _weapons = [];
    _weaponMagazines = [];
    
    for "_i" from 0 to (count drn_arr_AmmoDepotLaunchers - 1) do {
        private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
        
        _handGunItem = drn_arr_AmmoDepotLaunchers select _i;
        
        _weaponClassName = _handGunItem select 0;
        _probabilityOfPrecence = _handGunItem select 1;
        _minCount = _handGunItem select 2;
        _maxCount = _handGunItem select 3;
        _magazines = _handGunItem select 4;
        _magazinesPerWeapon = _handGunItem select 5;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _weaponCount = floor (_minCount + random (_maxCount - _minCount));
            _weapons set [count _weapons, [_weaponClassName, _weaponCount]];
            
            for "_j" from 0 to (count _magazines) - 1 do {
                _weaponMagazines set [count _weaponMagazines, [_magazines select _j, _weaponCount * _magazinesPerWeapon]];
            };
        };
    };
    
    if (count _weapons > 0) then {
        //_box = "Box_East_WpsLaunch_F" createVehicle [(_middlePos select 0) - 3, (_middlePos select 1) - 3, 0];
        _box = createVehicle ["Box_East_WpsLaunch_F", [(_middlePos select 0) - 3, (_middlePos select 1) - 3, 0.2], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
        {
            _box addWeaponCargoGlobal _x;
        } foreach _weapons;
        
        {
            _box addMagazineCargoGlobal _x;
        } foreach _weaponMagazines;
    };

    // Set markers
    
    _marker = createMarker ["drn_AmmoDepotMapMarker" + str _instanceNo, _middlePos];
    _marker setMarkerType "o_installation";
	_marker setMarkerText "Ammo";
    
    _marker = createMarkerLocal ["drn_AmmoDepotPatrolMarker" + str _instanceNo, _middlePos];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerAlpha 0;
    _marker setMarkerSizeLocal [50, 50];