/* CommonLib v1.04
 * Author: Engima of Ostgota Ops
 * History:
 *   2011-01-25: Created.
 *   2011-11-19: Updated to v1.01 - New version of function drn_fnc_CL_PositionIsInsideMarker. Still backward compatible with v1.00.
 *   2011-12-17: Added debug methods and method ShowTitleTextAllClients.
 *   2011-12-23: Added method drn_fnc_CL_InitParams
 */

/******************************************************************************************/
/* Variables */

// Set this variable to true if you want debug info to show only in RTF-file (and not on player's screens).
drn_var_CL_SilentDebugMode = false;

/******************************************************************************************/
/* Functions */

/*
 * Summary: Initializes the paramsArray with default values if played in single player.
 */

/******************************************************************************************/
// Debug stuff

drn_CL_DebugTextEventArgs = []; // Empty
drn_CL_DebugMarkerEventArgs = []; // [name, position, size, direction, shape ("RECTANGLE" or "ELLIPSE"), markerColor, markerText (optional)] or alternatively [name, position, type, markerColor (optional), markerText (optional)]
drn_CL_DeleteDebugMarkerEventArgs = [];  // [name]

"drn_CL_DebugTextEventArgs" addPublicVariableEventHandler {
    drn_CL_DebugTextEventArgs call drn_fnc_CL_ShowDebugTextLocal;
};

"drn_CL_DebugMarkerEventArgs" addPublicVariableEventHandler {
    drn_CL_DebugMarkerEventArgs call drn_fnc_CL_SetDebugMarkerLocal;
};

"drn_CL_DeleteDebugMarkerEventArgs" addPublicVariableEventHandler {
    drn_CL_DeleteDebugMarkerEventArgs call drn_fnc_CL_DeleteDebugMarkerLocal;
};

/*
 * Summary: Shows debug text on local client.
 * Remarks:
 *   if global variable "drn_var_CL_SilentDebugMode" is set to true, debug text will only be written to RTF-file and not shown on screen.
 * Arguments:
 *   _text: Debug text.
 */
drn_fnc_CL_ShowDebugTextLocal = {
    private ["_minutes", "_seconds"];
    
    if (!isNull player) then {
        if (!drn_var_CL_SilentDebugMode) then {
            player sideChat (_this select 0);
        };
    };
    
    _minutes = floor (time / 60);
    _seconds = floor (time - (_minutes * 60));
    diag_log ((str _minutes + ":" + str _seconds) + " Debug: " + (_this select 0));
};

/*
 * Summary: Shows debug text on all clients.
 * Remarks:
 *   if global variable "drn_var_CL_SilentDebugMode" is set to true, debug text will only be written to RTF-file and not shown on screen.
 * Arguments:
 *   _text: Debug text.
 */
drn_fnc_CL_ShowDebugTextAllClients = {
    drn_CL_DebugTextEventArgs = _this;
    publicVariable "drn_CL_DebugTextEventArgs";
    drn_CL_DebugTextEventArgs call drn_fnc_CL_ShowDebugTextLocal;
};

/*
 * Summary: Shows debug marker on local client.
 * Remarks:
 *   if global variable "drn_var_CL_SilentDebugMode" is set to true, debug marker will not shown.
 * Arguments alternative #1 (Marker representing an area):
 *   _markerName: Marker's name. (must be global unique).
 *   _position: Marker's position.
 *   _size: Marker's size on array format [x, y].
 *   _direction: Marker's direction.
 *   _shape: "RECTANGLE" or "ELLIPSE".
 *   _markerColor: Marker's color ("Default", "ColorRed", "ColorYellow" etc.).
 *   [_markerText]: Optional. Marker's text.
 * Arguments alternative #2 (Marker representing an icon).
 *   _markerName: Marker's name. (must be global unique).
 *   _position: Marker's position.
 *   _type: Markers icon type (applies to icons in cfgIcons, like "Warning", "mil_dot" etc.).
 *   [_markerColor]: Optional. Marker's color ("Default", "ColorRed", "ColorYellow" etc.).
 *   [_markerText]. Optional. Marker's text.
 */
drn_fnc_CL_SetDebugMarkerLocal = {
    private ["_markerName", "_position", "_size", "_direction", "_type", "_shape", "_markerColor", "_markerText"];
    private ["_marker"];

    if (!isNull player) then {
        if (!drn_var_CL_SilentDebugMode) then {
            _markerName = _this select 0;
            _position = _this select 1;
            _markerColor = "Default";
            _markerText = "";
            
            if (count _this == 6) then {
                _size = _this select 2;
                _direction = _this select 3;
                _shape = _this select 4;
                _markerColor = _this select 5;
            };
            if (count _this == 7) then {
                _size = _this select 2;
                _direction = _this select 3;
                _shape = _this select 4;
                _markerColor = _this select 5;
                _markerText = _this select 6;
            };
            if (count _this == 3) then {
                _type = _this select 2;
                _shape = "ICON";
            };
            if (count _this == 4) then {
                _type = _this select 2;
                _shape = "ICON";
                _markerColor = _this select 3;
            };
            if (count _this == 5) then {
                _type = _this select 2;
                _shape = "ICON";
                _markerColor = _this select 3;
                _markerText = _this select 4;
            };
            
            // Delete old marker
            if ([_markerName] call drn_fnc_CL_MarkerExists) then {
                deleteMarkerLocal _markerName;
            };
            
            // Set new marker
            _marker = createMarkerLocal [_markerName, _position];
            _marker setMarkerShapeLocal _shape;
            _marker setMarkerColorLocal _markerColor;
            _marker setMarkerTextLocal _markerText;
            
            if (count _this == 6 || count _this == 7) then {
                _marker setMarkerSizeLocal _size;
                _marker setMarkerDirLocal _direction;
            };
            if (count _this == 3 || count _this == 4 || count _this == 5) then {
                _marker setMarkerTypeLocal _type;
            };
        };
    };
};

/*
 * Summary: Shows debug marker on all clients.
 * Remarks:
 *   if global variable "drn_var_CL_SilentDebugMode" is set to true, debug marker will not shown.
 * Arguments alternative #1 (Marker representing an area):
 *   _markerName: Marker's name. (must be global unique).
 *   _position: Marker's position.
 *   _size: Marker's size on array format [x, y].
 *   _direction: Marker's direction.
 *   _shape: "RECTANGLE" or "ELLIPSE".
 *   _markerColor: Marker's color ("Default", "ColorRed", "ColorYellow" etc.).
 *   [_markerText]: Optional. Marker's text.
 * Arguments alternative #2 (Marker representing an icon).
 *   _markerName: Marker's name. (must be global unique).
 *   _position: Marker's position.
 *   _type: Markers icon type (applies to icons in cfgIcons, like "Warning", "mil_dot" etc.).
 *   [_markerColor]: Optional. Marker's color ("Default", "ColorRed", "ColorYellow" etc.).
 *   [_markerText]. Optional. Marker's text.
 */
drn_fnc_CL_SetDebugMarkerAllClients = {
    drn_CL_DebugMarkerEventArgs = _this;
    publicVariable "drn_CL_DebugMarkerEventArgs";
    drn_CL_DebugMarkerEventArgs call drn_fnc_CL_SetDebugMarkerLocal;
};

/*
 * Summary: Deletes a debug marker on local client.
 * Arguments:
 *   _markerName: Name of marker to delete.
 */
drn_fnc_CL_DeleteDebugMarkerLocal = {
    private ["_markerName"];
    _markerName = _this select 0;
    deleteMarkerLocal _markerName;
};

/*
 * Summary: Deletes a debug marker on all clients.
 * Arguments:
 *   _markerName: Name of marker to delete.
 */
drn_fnc_CL_DeleteDebugMarkerAllClients = {
    drn_CL_DeleteDebugMarkerEventArgs = _this;
    publicVariable "drn_CL_DeleteDebugMarkerEventArgs";
    drn_CL_DeleteDebugMarkerEventArgs call drn_fnc_CL_DeleteDebugMarkerLocal;
};

drn_var_CL_CommonLibVersion = 1.04;

if (isServer || isDedicated) then 
	{
	drn_var_commonLibInitialized = true;
	};
	
