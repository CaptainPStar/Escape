/*
 * Summary: Shows a text as a title text on all clients.
 * Arguments:
 *   _text: Text to show.
 *   [_showAsSubTitle]: Optional. true if the text are to be shown as a sub title. false if it's to be shown in the middle of the screen.
 */
private ["_text", "_showAsSubTitle"];
_text = _this select 0;
if (count _this > 1) then {_showAsSubTitle = _this select 1;} else {_showAsSubTitle = false};

[[_text, _showAsSubTitle],"drn_fnc_CL_ShowTitleTextLocal",true] call bis_fnc_mp;
