private["_player","_didJIP"];

_player = _this select 0;
_didJIP =  _this select 1;

if(name _player == "HC") then {
    ["HC present. Offloading AI."] spawn a3e_fnc_debugChat;
    A3E_HC_ID = owner _player;
    if(A3E_HC_ID==0) exitwith {
         ["Getting HC ID failed!"] spawn a3e_fnc_debugChat;
    };
} else {
    [format["%1 joined the Game!",name _player]] spawn a3e_fnc_debugChat;

    A3E_Players = A3E_Players + [_player];
    publicVariable "A3E_Players";

    waituntil{sleep 0.1; count(A3E_StartPos)>0};
	if(time > 20) then {
		_players = (call drn_fnc_Escape_GetPlayers);
		_found = false;
		{
			if(_player != _x) exitwith {
				_player setPos [(getpos _x select 0) + (random 4) - 2, (getpos _x select 1) + (random 6) - 3, 0];
				_found = true;
			};
		} foreach _players;
		if(!_found) then {
			player setPos [(drn_startPos select 0) + (random 4) - 2, (drn_startPos select 1) + (random 6) - 3, 0];
			[["Warning: JIP-Player could not be ported to group!"], "A3E_FNC_systenChat", true, false] spawn BIS_fnc_MP;
		};
	} else {
		_player setpos [(A3E_StartPos select 0)+random 5.0-2.5,(A3E_StartPos select 1)+random 5.0-2.5,0];
		_player setdir (random 360);
	};

};
