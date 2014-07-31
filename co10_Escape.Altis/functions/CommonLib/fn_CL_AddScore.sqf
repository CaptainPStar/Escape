private ["_unit", "_score"];
private ["_vehicleVarName"];

_unit = _this select 0;
_score = _this select 1;    

_vehicleVarName = vehicleVarName _unit;
_drn_CL_AddScoreEventArgs = [_vehicleVarName, _score];

if (isServer) then {
	_drn_CL_AddScoreEventArgs call drn_fnc_CL_AddScoreServer;
} else {
	[_drn_CL_AddScoreEventArgs,"drn_fnc_CL_AddScoreServer",false] call bis_fnc_mp;
};