private ["_generatorTrailer","_unit","_id","_marker","_count","_text","_pos","_maxDistance","_mode","_i","_foundPos","_flag","_chopLandPos1","_chopLandPos2","_chopLandMarker1","_chopLandMarker2","_max_range","_min_range"];

_generatorTrailer = _this select 0;
_unit = _this select 1;
_id = _this select 2;

_count = 20;

private ["_pos", "_maxDistance"];


if (typeOf _unit == "B_engineer_F") then {
	_count = 10;
};


while {(_count > 0) && (_unit distance _generatorTrailer < 3)} do
{
	_text = "HIJACKING " + str _count;

	cutText [_text, "Plain", 1];
	sleep 1;

	_count = _count - 1;
};



if (_count > 0 && _unit distance _generatorTrailer > 3) exitWith {
    cutText ["You must get closer!", "Plain", 1];
};

cutText ["", "Plain", 1];


//### The Range for extraction is hardcoded at the moment... should be changed to a param
//### mode 0: totally random
//### mode 1: try to pick a close extraction point
//### mode 2: try to pick a extraction far away 
_mode = Param_ExtractionSelection;


_maxDistance = 1000;
_pos = [];
_foundPos = 0;
_max_range = 3000;
_min_range = 3000;

if (_count == 0) then {

	_flag = false;
	
for[{_i = 0},{_i<55},{_i = _i +1}] do  
{
		_pos = call A3E_fnc_findFlatArea;
		
		drn_var_Escape_ExtractionMarkerPos = _pos;
		
		
		if ((_generatorTrailer distance drn_var_Escape_ExtractionMarkerPos) > 2000 && (_mode == 0)) exitwith 
		{
		_foundPos = 1; 
		//hintsilent "random"; 
		//sleep 3; 
		//hintsilent "";
		};

		if ((_generatorTrailer distance drn_var_Escape_ExtractionMarkerPos) <_max_range && _mode == 1) exitwith 
		{
		_foundPos = 1; 
		//hintsilent "close"; 
		//sleep 3; 
		//hintsilent "";
		};

		if (((_generatorTrailer distance drn_var_Escape_ExtractionMarkerPos)>_min_range) && (_mode == 2)) exitwith 
		{
		_foundPos = 1; 
		//hintsilent "far"; 
		//sleep 3; 
		//hintsilent "";
		};
};

	_chopLandPos1 = [];
	_chopLandPos2 = [];
	
	//hint str [drn_var_Escape_ExtractionMarkerPos];
	_marker = createMarker ["extractionPosMarker", drn_var_Escape_ExtractionMarkerPos];
	
	_chopLandPos1 = [(drn_var_Escape_ExtractionMarkerPos select 0) + 20, (drn_var_Escape_ExtractionMarkerPos select 1) + 20, (drn_var_Escape_ExtractionMarkerPos select 2)]; 
	_chopLandPos2 = [(drn_var_Escape_ExtractionMarkerPos select 0) - 20, (drn_var_Escape_ExtractionMarkerPos select 1) - 20, (drn_var_Escape_ExtractionMarkerPos select 2)]; 
    publicVariable "drn_var_Escape_ExtractionMarkerPos";
	
	_chopLandMarker1 = createMarker ["chopLandMarker1", _chopLandPos1];
	_chopLandMarker2 = createMarker ["chopLandMarker2", _chopLandPos2];
    
    if (!isNil "drn_var_Escape_ExtractionMarker") then {
        deleteMarker drn_var_Escape_ExtractionMarker;
    };
    drn_var_Escape_ExtractionMarker = createMarker ["drn_visibleGoalMarker", drn_var_Escape_ExtractionMarkerPos];
    drn_var_Escape_ExtractionMarker setMarkerType "Flag_NATO";
    
    [drn_var_Escape_ExtractionMarkerPos] call drn_fnc_Escape_CreateExtractionPointServer;
    
    ["drn_hijackTasks", "SUCCEEDED"] call drn_SetTaskStateOnAllMachines;
    ["Task complete: Hijack Communication Center (Rendezvous point marked on map)"] call drn_fnc_CL_ShowTitleTextAllClients;
    
    _generatorTrailer removeAction _id;
};


