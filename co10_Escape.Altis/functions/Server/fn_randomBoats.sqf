private ["_mapCentre","_surface","_probePosN","_probePosE","_probePosS","_probePosW","_isWaterN","_isWaterE","_isWaterS","_isWaterW","_Wcounter","_boatType","_boat","_Scounter","_Lcounter","_notFull","_probePos","_isWater","_boatlist","_SouthWest","_NorthEast","_bestPosArray"];

_boatlist = [
"C_Boat_Civil_01_F",
"C_Boat_Civil_01_police_F",
"C_Boat_Civil_01_rescue_F",
"C_rubberboat"]; 

altExtractPlan = "";

diag_log "++++ Random boats script is running ++++";
_mapCentre = [(A3E_WorldSize / 2), (A3E_WorldSize /2 ), 0];
_SouthWest = [0, 0, 0];
_NorthEast = [A3E_WorldSize, A3E_WorldSize, 0];

_bestPosArray = [];

_Wcounter = 0;
_Scounter = 0;
_Lcounter = 0;
_notFull = true;
_surface = "";
_boatType = "";
//_boat = objNull;

while {_notFull} do {

_probePos = [(_SouthWest select 0) + random (_NorthEast select 0),(_SouthWest select 1) + random (_NorthEast select 1),0];


_isWater = surfaceIsWater _probePos;

	if (_isWater) then 
		{		
		_surface = "water";		
		}
		else
		{
		_surface = "land";
		};

if (_surface == "water") then
	{
	_probePosN = [(_probePos select 0), (_probePos select 1) + 30, 0];
	_probePosE = [(_probePos select 0) + 30, (_probePos select 1), 0];
	_probePosS = [(_probePos select 0), (_probePos select 1) - 30, 0];
	_probePosW = [(_probePos select 0) - 30, (_probePos select 1), 0];

	_isWaterN = surfaceIsWater _probePosN;
	_isWaterE = surfaceIsWater _probePosE;
	_isWaterS = surfaceIsWater _probePosS;
	_isWaterW = surfaceIsWater _probePosW;
	
	if (!_isWaterN || !_isWaterN || !_isWaterN || !_isWaterN) then 
		{
		_surface = "shore";
		};
	};
	
//// create relevant marker
switch (_surface) do
{
	case "water":
	{
	//_marker = createMarkerLocal ["water" + str _Wcounter, _probePos];
	//_marker setMarkerType "mil_destroy";
	//_marker setMarkerColor "ColorBlue";
	//_marker setMarkerText "water";
	//_marker setMarkerSize [0.2,0.2];	
	_Wcounter = _Wcounter + 1;
	};

	case "shore":
	{
	_boatType = _boatlist select (floor (random (count _boatlist)));
	_boat = createVehicle [_boatType, _probePos, [], 0, "NONE"];   
	_boat setfuel (0.3 + random 0.5);
	//_marker = createMarkerLocal ["shore" + str _Wcounter, _probePos];
	//_marker setMarkerType "mil_destroy";
	//_marker setMarkerColor "ColorYellow";
	//_marker setMarkerText "shore";
	//_marker setMarkerSize [0.6,0.6];	
	_Scounter = _Scounter + 1;
	};
	
		case "land":
	{
	//_marker = createMarkerLocal ["land" + str _Wcounter, _probePos];
	//_marker setMarkerType "mil_destroy";
	//_marker setMarkerColor "ColorGreen";
	//_marker setMarkerText "land";
	//_marker setMarkerSize [0.2,0.2];	
	_Lcounter = _Lcounter + 1;
	};
};	

if (_Wcounter < 2 && _Lcounter > 400) exitWith 
	{
	altExtractPlan = "land";
	//hintsilent "There is no sea on this map!";
	};
	
//_surface = surfaceType _probePos;
//diag_log _surface;

//if (_Wcounter > 100 && _Lcounter > 100) then 
if (_Scounter > 20) then 
	{
	altExtractPlan = "sea";
	_notFull = false;
	};

};