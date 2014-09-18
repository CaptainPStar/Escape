_jip = _this select 0;
_players = (call drn_fnc_Escape_GetPlayers);
_found = false;

_jip setVariable ["AT_Revive_isUnconscious", false, false];
_jip setDamage 0;
_jip allowDamage false;

waitUntil {count allMapMarkers > 0}; 
{_x setMarkerPos (getMarkerPos _x);} foreach allMapMarkers;

{
	if(_jip != _x) exitwith {
		_jip setPosATL [(getpos _x select 0) + (random 4) - 2, (getpos _x select 1) + (random 6) - 3, 0.2];
		_jip unassignItem "ItemMap";
		_jip removeItem "ItemMap";
		_found = true;
	};
} foreach _players;

if(!_found) then {
	player setPosATL [(drn_startPos select 0) + (random 4) - 2, (drn_startPos select 1) + (random 6) - 3, 0.2];
	[["Warning: JIP-Player could not be ported to group!"], "A3E_FNC_systemChat", true, false] spawn BIS_fnc_MP;
};

sleep 5;

_jip setDamage 0;
_jip allowDamage true;