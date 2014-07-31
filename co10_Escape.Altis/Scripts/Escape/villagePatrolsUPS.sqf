if (!isServer) exitWith {};

private ["_mapCentre","_playr","_xPos","_marker","_players"];



///////////////////////////////////
// create infantry loop
///////////////////////////////////
0 = [] spawn {
while {true} do {
private ["_chance","_marker","_counter","_grp","_man","_housePos","_spawnPos","_infDel","_house","_entHouse","_playr","_men","_players"];
private ["_menClose","_menCount","_houses","_houseCount"];


_houseCount = 0;
_players = (switchableUnits + playableUnits);
_chance = 0;

// create stuff
{
_playr = _x;
_houses = nearestObjects [position _playr, ["house"], 80];
_houseCount = (count _houses);
_counter = 0;
_housePos = [];

_chance = 0;
//_men = 0;
_menCount = 0;
(str _playr + "midvillage") setMarkerPos (getPos _playr);


	{
		_house = _houses select _counter;
		_entHouse = [_house] call BIS_fnc_isBuildingEnterable;
		
		if (_entHouse) then 		
			{	
			_housePos = getPos _house;			
			_menClose = _housePos nearEntities ["Man", 30];
			_men = _housePos nearEntities ["Man", 150];
			_menCount = (count _men);
			_chance = (floor(random 100));
			_spawnPos = [_housePos select 0, _housePos select 1, (_housePos select 2) + 0.5];
			_infDel = 0;
				{
					if (_housePos distance _x < 70) then {
						_chance = 0;
						};
									
				} forEach _players;
			
				
				if (count _menClose < 3 && _chance > 60 && _menCount < 12) then
					{					
					//_marker = createMarker [str _playr + "house" + str infNo, _housePos];
					//_marker setMarkerType "mil_destroy";
					//_marker setMarkerColor "ColorOrange";
					//_marker setMarkerSize [0.6,0.6];
					
					
					
					[_spawnPos,_playr] spawn a3e_fnc_villageSquads;
					//diag_log "-=-=-=-= squad spawned - infarray =-=-=-=-";
					//diag_log infarray;
					//hintsilent "Pausing Village Patrol Spawning";
					sleep 30;
					//hintsilent "";
					};

			};
			
		_counter = _counter + 1;

	} forEach _houses;
	sleep 0.4;
} forEach _players;	


sleep 10;

};
};


///////////////////////////////////
// delete infantry loop
///////////////////////////////////
0 = [] spawn {
while {true} do {
private ["_infDel","_markers","_infUnit","_countNo","_counter","_players"];

_countNo = 0;
_countNo = count infArray;
_counter = 0;
_players = (switchableUnits + playableUnits);

{
_infUnit = _x;

////diag_log "-=-=-=-=-players near infantry array-=-=-=-=-";
////diag_log _men;
_infDel = 0;
	{
		if (_infUnit distance _x > 200) then {
			_infDel = _infDel + 1;
			};
						
	} forEach _players;

if (_infDel == (count _players)) then {
		_infDel = 0;
		
		//_markers = allMapMarkers;
		//{
		//if (((getMarkerPos _x) distance (getPos _infUnit)) < 15) then {
		//	deleteMarker _x;
		//		};
		//} forEach _markers;
		
		deleteVehicle _infUnit;
		//_marker = str _playr + "house" + str infNo;
		//deleteMarker _marker; 
		infArray = infArray - [_infUnit];
		if (infNo > 0) then {
					infNo = infNo - 1;
					};		
		};
} forEach infArray;
sleep 60;


};
};










		
