private ["_i","_selectedMarker","_startMarkers"];
    diag_log "placePlayers called...";
    
	
	_startMarkers = ["playerspawn"];
    _i = 1;
    while { _i <= 50} do {
        _startMarkers = _startMarkers + [format ["%1_%2", _startMarkers select 0, _i]];
		_i = _i + 1;
    };
      
	 diag_log format ["startmarkers %1", _startMarkers];
    
    // Place players
   
    {
        
        
        _selectedMarker = _startMarkers call BIS_fnc_selectRandom;
        
        _startMarkers = _startMarkers - [_selectedMarker];
        
        _x setPos (getMarkerPos _selectedMarker);
        _x setDir (markerDir _selectedMarker);
    } foreach allUnits;
    
    diag_log format ["placePlayers done with %1!", allUnits];