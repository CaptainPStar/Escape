    private ["_middlePos", "_staticWeaponClasses", "_parkedVehicleClasses"];
    private ["_object", "_pos", "_marker", "_instanceNo", "_randomNo", "_gun", "_angle", "_car", "_azimut", "_choppa"];
    
	_azimut = 0;
    _middlePos = _this select 0;
    _staticWeaponClasses = _this select 1;
    _parkedVehicleClasses = _this select 2;
    
	//_azimut = floor(random 360);
    if (isNil "drn_BuildHeliBase_MarkerInstanceNo") then {
        drn_BuildHeliBase_MarkerInstanceNo = 0;
    }
    else {
        drn_BuildHeliBase_MarkerInstanceNo = drn_BuildHeliBase_MarkerInstanceNo + 1;
    };
    _instanceNo = drn_BuildHeliBase_MarkerInstanceNo;
    _choppaRand = 0;
	
	// Call Object Mapper
	0 = [_middlePos, _azimut, call (compile (preprocessFileLineNumbers "Structures\HeliBase.sqf"))] call BIS_fnc_ObjectsMapper;
	_choppaPos = [_middlePos select 0, _middlePos select 1, 0];
	
	_choppaRand = floor(random 100);
	
	if (_choppaRand < 50) then {	
	_choppa = createVehicle ["O_Heli_Light_02_unarmed_F", _choppaPos, [], 0, "NONE"];
	}
	else
	{
	_choppa = createVehicle ["B_Heli_Light_01_F", _choppaPos, [], 0, "NONE"];
	};
	
	//_heliPos = [(_middlePos select 0) + 6, (_middlePos select 1) - 4, _middlePos select 2];
    //_choppa setPos _heliPos;
    //_choppa setDir _azimut;
	_randFuel = (random 0.18);
	_choppa setFuel _randFuel;
		
    // Set markers
    
    _marker = createMarker ["drn_HeliBaseMapMarker" + str _instanceNo, _middlePos];
    _marker setMarkerType "o_air";
	_marker setMarkerText "Air";
	_marker setMarkerColor "Color4_FD_F";
    
    _marker = createMarkerLocal ["drn_HeliBasePatrolMarker" + str _instanceNo, _middlePos];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerAlpha 0;
    _marker setMarkerSizeLocal [80, 80];