private ["_updating","_allINDUnitsWanted","_currentTurn","_wantedMarkerName"];

_updating = true;
_currentTurn = 0;
markerUpdateSleep = 5;



while {_updating} do {
    //hint format ["Players %1, Quarries: %2, Ownindex: %3", playerUnits, quarryUnits, ownIndex];
 
    "ownMarker" setMarkerPosLocal getPos player;
    
	//build a list of civ units
	_allINDUnitsWanted = [];
	{
		if ((faction _x) == "IND_F" ) then {
			_allINDUnitsWanted = _allINDUnitsWanted + [_x];
		};
	} forEach allUnits;

	diag_log _allINDUnitsWanted;
	
    if (_currentTurn % markerUpdateSleep == 0) then {
		
		{
			 
			 _wantedMarkerName = format["wantedMarker_%1",  _x call BIS_fnc_objectVar];
			diag_log _wantedMarkerName;
			 if (isNil (_wantedMarkerName)) then {
				 createMarkerLocal [(str _wantedMarkerName), getPos _x];
				(str _wantedMarkerName) setMarkerShapeLocal "ICON";
				(str _wantedMarkerName) setMarkerTypeLocal "mil_dot";
				(str _wantedMarkerName) setMarkerColorLocal "ColorCIV";
				
			 };
			 if (alive _x) then {
				 (str _wantedMarkerName) setMarkerAlphaLocal 1;
				 (str _wantedMarkerName) setMarkerPosLocal getPos _x;
				 if ((_x getVariable "wanted") == 1) then {
				    (str _wantedMarkerName) setMarkerColorLocal "ColorEAST";
					(str _wantedMarkerName) setMarkerTextLocal format["<-- %1", name _x];
				 };
		  } else {
				 (str _wantedMarkerName) setMarkerAlphaLocal 0;
		  };
			
		} forEach _allINDUnitsWanted;
	};
    
    sleep 1;
    
    _currentTurn = _currentTurn + 1;
};
