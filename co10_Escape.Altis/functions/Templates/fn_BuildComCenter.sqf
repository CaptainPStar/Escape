private ["_centerPos", "_rotateDir", "_staticWeaponClasses", "_parkedVehicleClasses", "_index"];
private ["_pos", "_dir", "_posX", "_posY", "_sectionDir", "_guns", "_gun", "_vehicle", "_powerGenerator"];
private ["_fnc_CreateObject"];
private ["_obj", "_buildingType"];


_centerPos = _this select 0;
_rotateDir = _this select 1;

if (count _this > 2) then { _staticWeaponClasses = _this select 2; } else { _staticWeaponClasses = []; };
if (count _this > 3) then { _parkedVehicleClasses = _this select 3; } else { _parkedVehicleClasses = []; };

_fnc_CreateObject = {
    private ["_className", "_relativePos", "_relativeDir", "_centerPos", "_rotateDir"];
    private ["_object", "_realPos", "_realDir"];
    
    _className = _this select 0;
    _relativePos = _this select 1;
    _relativeDir = _this select 2;
    _centerPos = _this select 3;
    _rotateDir = _this select 4;
    
    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1)], _rotateDir] call a3e_fnc_RotatePosition);
    _realDir = _relativeDir + _rotateDir;
    _object = createVehicle [_className, _realPos, [], 0, "CAN_COLLIDE"];
    _object setDir _realDir;
    //_object lock true;
    _object
};

_fnc_CreateVehicle = {
    private ["_className", "_relativePos", "_relativeDir", "_centerPos", "_rotateDir"];
    private ["_object", "_realPos", "_realDir"];
    
    _className = _this select 0;
    _relativePos = _this select 1;
    _relativeDir = _this select 2;
    _centerPos = _this select 3;
    _rotateDir = _this select 4;
    
    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1)], _rotateDir] call a3e_fnc_RotatePosition);
    _realDir = _relativeDir + _rotateDir;
    //_object = _className createVehicle _realpos;
    _object = createVehicle [_className, _realpos, [], 0, "NONE"];
    _object setDir _realDir;
    //_object lock true;
    _object
};

//_buildingType = floor(random 2);
_buildingType = 1;

switch (_buildingType) do {
    case 0: 
	{
	
		// Call Object Mapper
		_objects = [_centerPos, _rotateDir, call (compile (preprocessFileLineNumbers "Structures\CommCentre.sqf"))] call BIS_fnc_ObjectsMapper;
		
		_generator = _objects select 2;
		[[_generator, "Hijack", "Scripts\Escape\Hijack.sqf"], "a3e_fnc_addHijackAction", true, false] spawn BIS_fnc_MP;
		_generator allowDamage false;
		
		_medBuilding = _objects select 8;
		[[_medBuilding, "Heal at medical building", "Scripts\Escape\HealAtMedicalBuilding.sqf"], "a3e_fnc_addHealAtMedicalBuildingAction", true, false] spawn BIS_fnc_MP;
	
		if (count _parkedVehicleClasses > 0) then {
		_pos = [11.5, 12];
		_dir = 270;
		
		_vehicle = _parkedVehicleClasses select floor random count _parkedVehicleClasses;
		[_vehicle, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateVehicle;
		
		_pos = [11.5, 6.5];
		_dir = 270;
		
		_vehicle = _parkedVehicleClasses select floor random count _parkedVehicleClasses;
		[_vehicle, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
		};

	};
    case 1: 
	{
	
		// Call Object Mapper
		_objects = [_centerPos, _rotateDir, call (compile (preprocessFileLineNumbers "Structures\CommCentre_2.sqf"))] call BIS_fnc_ObjectsMapper;
		
		_phoneHack = _objects select 4;
		[[_phoneHack, "Hijack", "Scripts\Escape\Hijack.sqf"], "a3e_fnc_addHijackAction", true, false] spawn BIS_fnc_MP;
		_phoneHack allowDamage false;
		
		_medBuilding = _objects select 12;
		[[_medBuilding, "Heal at medical building", "Scripts\Escape\HealAtMedicalBuilding.sqf"], "a3e_fnc_addHealAtMedicalBuildingAction", true, false] spawn BIS_fnc_MP;
	
		if (count _parkedVehicleClasses > 0) then {
		_pos = [25, 2];
		_dir = 90;
		
		_vehicle = _parkedVehicleClasses select floor random count _parkedVehicleClasses;
		[_vehicle, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateVehicle;
		
		_pos = [25, 7];
		_dir = 90;
		
		_vehicle = _parkedVehicleClasses select floor random count _parkedVehicleClasses;
		[_vehicle, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
		};
	};
};

// Call Object Mapper
//	0 = [_centerPos, _rotateDir, call (compile (preprocessFileLineNumbers "Structures\CommCentre_2.sqf"))] call BIS_fnc_ObjectsMapper;

/*	
// power generator
_pos = [0, -9];
_dir = 90;
_obj = ["Land_PowerGenerator_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
[[_obj, "Hijack", "Scripts\Escape\Hijack.sqf"], "a3e_fnc_addHijackAction", true, false] spawn BIS_fnc_MP;
_obj allowDamage false;
*/

/*
// medical building
_pos = [13, 1];
_dir = 90;
_obj = ["Land_Medevac_House_V1_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
[[_obj, "Heal at medical building", "Scripts\Escape\HealAtMedicalBuilding.sqf"], "a3e_fnc_addHealAtMedicalBuildingAction", true, false] spawn BIS_fnc_MP;






if (count _staticWeaponClasses > 0) then {
    // Statics
    _pos = [-17, 13.5];
    _dir = 0;
    
    _gun = _staticWeaponClasses select floor random count _staticWeaponClasses;
    [_gun, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
    
    _pos = [17, -9.5];
    _dir = 135;
    
    //_guns = ["DSHkM_Mini_TriPod", "AGS_Ins", "DSHKM_Ins"];
    _guns = ["O_HMG_01_high_F"];
    _gun = _guns select floor random count _guns;
    [_gun, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
};
*/

