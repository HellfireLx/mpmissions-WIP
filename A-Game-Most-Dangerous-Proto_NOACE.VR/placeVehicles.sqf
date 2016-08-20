private ["_i","_selectedMarker","_startMarkers"];
diag_log "placeVehicles called...";

 "vehiclespawn" setMarkerAlpha 0;
_startMarkers = ["vehiclespawn"];
_i = 1;
while { _i <= 30} do {
	format ["%1_%2", _startMarkers select 0, _i] setMarkerAlpha 0;
	_startMarkers = _startMarkers + [format ["%1_%2", _startMarkers select 0, _i]];
	_i = _i + 1;
	
};

diag_log format ["startmarkers %1", _startMarkers];




// Place vehicles exisiting on the map on the markers.

{
	
	
	_selectedMarker = _startMarkers call BIS_fnc_selectRandom;
	
	_startMarkers = _startMarkers - [_selectedMarker];
	
	_x setPos (getMarkerPos _selectedMarker);
	_x setDir (markerDir _selectedMarker);
} foreach vehicles;

diag_log format ["placeVehicles done with %1!", allUnits];