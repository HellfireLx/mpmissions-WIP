private ["_updating","_quarryUnit","_currentTurn"];

_updating = true;
_currentTurn = 0;
markerUpdateSleep = 10;



while {_updating} do {
    //hint format ["Players %1, Quarries: %2, Ownindex: %3", playerUnits, quarryUnits, ownIndex];
 
    "ownMarker" setMarkerPosLocal getPos player;
    
    if (_currentTurn % markerUpdateSleep == 0) then {
      
		if (!isNil {player getVariable "quarry"}) then {
			_quarryUnit = player getVariable "quarry";
			if (alive _quarryUnit) then {
				"quarryMarker" setMarkerAlphaLocal 1;
				"quarryMarker" setMarkerPosLocal getPos _quarryUnit;
				"quarryMarker" setMarkerTextLocal format ["<-- %1", name _quarryUnit];
			} else {
				"quarryMarker" setMarkerAlphaLocal 0;
			};
		};
		
    };
    
    sleep 1;
    
    _currentTurn = _currentTurn + 1;
};
