if (!isServer) exitWith {};
private ["_enemyMinSkill", "_enemyMaxSkill", "_enemyFrequency"];
_enemyMinSkill = _this select 0;
_enemyMaxSkill = _this select 1;
_enemyFrequency = _this select 2;

sleep 240;

0 = [_enemyMinSkill, _enemyMaxSkill, _enemyFrequency ] spawn {
while {true} do
	{
	private ["_enemyMinSkill", "_enemyMaxSkill", "_enemyFrequency", "_delay", "_sleep", "_surprise"];
	
	_enemyMinSkill = _this select 0;
	_enemyMaxSkill = _this select 1;
	_enemyFrequency = _this select 2;
	
	_delay = 210;
	// Wait for a random amount of time
	_sleep = floor(random 180) + _delay;
	//diag_log _sleep;
	sleep _sleep;
	
	// Pick which surprise to run
	
	//_surprise = floor(random 7);
	
	// 0 = drop chopper
	// 1 = russian search chopper
	// 2 = motorized search group
	// 3 = civilian enemy
	// 4 = reinforcement truck
	// 5 = fast mover
	// 6 = stolen a164
	// 7 = new search chopper
	
	_surprisearray = [0,0,0,0,0,0,0,0,1,2,2,2,2,2,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,6,7,7,7,7,7,7,7,7];
	_surprise = _surprisearray select floor (random (count _surprisearray));
	
	
	
	[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency, _surprise] call A3E_fnc_runSurprise;

	
	};
	};