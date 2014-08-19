private ["_installType", "_marker"];

_locationMapMarkerName = _this select 0;
_instanceNo = _this select 1;

_marker = _locationMapMarkerName + str _instanceNo;
//_marker = format ["%1", [_locationMapMarkerName,_instanceNo]];
_installType = _locationMapMarkerName;

diag_log _marker;
diag_log _installType;

switch _installType do {
	case "drn_CommunicationCenterMapMarker":
	{
    _marker setMarkerType "flag_CSAT";
	_marker setMarkerColor "Color1_FD_F";
	_marker setMarkerText "Comms";
	//_marker setVariable ["installFound", true, true];
//	A3E_CommInstallFound set [_instanceNo, 1];
//	publicVariable "A3E_CommInstallFound";
	};
	case "drn_AmmoDepotMapMarker":
	{
	_marker setMarkerType "o_installation";
	_marker setMarkerText "Ammo";
	_marker setMarkerColor "ColorRed";
//	A3E_AmmoInstallFound set [_instanceNo, 1];
//	publicVariable "A3E_AmmoInstallFound";
	};
	case "drn_HeliBaseMapMarker":
	{
	_marker setMarkerType "o_air";
	_marker setMarkerText "Air";
	_marker setMarkerColor "Color4_FD_F";
//	A3E_HeliInstallFound set [_instanceNo, 1];
//	publicVariable "A3E_HeliInstallFound";
	};
	case "drn_ArtilleryPosition":
	{
	_marker setMarkerType "o_art";
	_marker setMarkerColor "Color2_FD_F";
	_marker setMarkerText "Artillery";
//	A3E_ArtiInstallFound set [_instanceNo, 1];
//	publicVariable "A3E_ArtiInstallFound";
	};
	
	
	default
	{
	_marker setMarkerType "mil_box";
	_marker setMarkerColor "ColorRed";
	_marker setMarkerText "Fail";
	};
};
