/*
 * Summary: Shows a text as command text on all clients.
 * Arguments:
 *   _text: Text to show.
 */
private ["_text"];
_text = _this select 0;

[[_text],"drn_fnc_CL_ShowCommandTextLocal",true] call bis_fnc_mp;
