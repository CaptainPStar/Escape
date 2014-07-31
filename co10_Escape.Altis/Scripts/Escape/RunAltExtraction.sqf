if (!isServer) exitWith {};

private ["_extractPos","_surface","_notAtExtract","_reachedExt"];

_extractPos = _this select 0;
_surface = _this select 1;
_notAtExtract = true;

["All players must reach the extraction point."] call drn_fnc_CL_ShowTitleTextAllClients;

if (isMultiplayer) then {
    waitUntil {{_x distance _extractPos < 80} count (call drn_fnc_Escape_GetPlayers) == count (call drn_fnc_Escape_GetPlayers)};
}
else {
    waitUntil {{_x distance _extractPos < 80} count units group ((call drn_fnc_Escape_GetPlayers) select 0) == count units group ((call drn_fnc_Escape_GetPlayers) select 0)};
};


["Task complete: Rendesvouz with allied forces."] call drn_fnc_CL_ShowTitleTextAllClients;

sleep 15;

["drn_rendesvouzTasks", "SUCCEEDED"] call drn_SetTaskStateOnAllMachines;
drn_var_Escape_MissionComplete = true;
publicVariable "drn_var_Escape_MissionComplete";