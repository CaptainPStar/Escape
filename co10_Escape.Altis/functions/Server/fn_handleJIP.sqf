_jip = _this select 0;
_players = (call drn_fnc_Escape_GetPlayers);
_found = false;

waitUntil {count allEscapeMarkers > 0}; 
{_x setMarkerPos (getMarkerPos _x);} foreach allEscapeMarkers;

{
	if(_jip != _x) exitwith {
		_jip setPos [(getpos _x select 0) + (random 4) - 2, (getpos _x select 1) + (random 6) - 3, 0];
		_found = true;
	};
} foreach _players;
if(!_found) then {
	player setPos [(drn_startPos select 0) + (random 4) - 2, (drn_startPos select 1) + (random 6) - 3, 0];
	[["Warning: JIP-Player could not be ported to group!"], "A3E_FNC_systemChat", true, false] spawn BIS_fnc_MP;
};