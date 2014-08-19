private ["_startPos","_isOk","_result","_roadSegments","_gradChoice","_gradient","_surface","_buildings","_startPosN","_startPosE","_startPosS","_startPosW","_isWaterN","_isWaterE","_isWaterS","_isWaterW"];
_isOk = false;
_gradient = 0;
_gradChoice = Param_BuildingGradient;
		switch (_gradChoice) do{
			case 0: {_gradient = 0.10;};    // Very Flat
            case 1: {_gradient = 0.35;};    // Slight Incline (Default)
            case 2: {_gradient = 0.55;};  	// Fair Incline 
            case 3: {_gradient = 0.75;};  	// Steep Incline
			case 4: {_gradient = 1;};  	// Very Steep Incline
        };
_surface = "";		
while {!_isOk} do {
	
    _startPos = [(SWpos select 0) + random (NEpos select 0),(SWpos select 1) + random (NEpos select 1),0];

    _result = _startPos isFlatEmpty [5, 0, _gradient, 1, 0, false, objNull];
    _roadSegments = _startPos nearRoads 30;
    _buildings = _startPos nearObjects 20;
	
	
	
	
	if ((count _result > 0) && (count _roadSegments < 50) && (!surfaceIsWater _startPos) && (count _buildings < 50)) then {
                        _startPos = _result;
	
       if (count(_result nearObjects ["House",10]) < 50) then {
           _isOk = true;
       };
    };
};
[_startPos select 0,_startPos select 1,0]