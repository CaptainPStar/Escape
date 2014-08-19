private ["_text"];
_text = _this select 0;

if (!isNull player) then {
	player globalChat _text;
};

diag_log ("Title text: " + _text);