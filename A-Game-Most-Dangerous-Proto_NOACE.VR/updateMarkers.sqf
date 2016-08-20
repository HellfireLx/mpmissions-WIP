private ["_updating","_quarryArray","_quarryUnit","_currentTurn"];

_updating = true;
_currentTurn = 0;
markerUpdateSleep = 10;



while {_updating} do {
    //hint format ["Players %1, Quarries: %2, Ownindex: %3", playerUnits, quarryUnits, ownIndex];
 
    "ownMarker" setMarkerPosLocal getPos player;
    
    if (_currentTurn % markerUpdateSleep == 0) then {
        //get the quarry from the server ,only he knows the right thing
		_quarryArray = player getVariable "quarry";
		if (!isNil "_quarryArray") then {
			_quarryUnit = _quarryArray select 0;
			if (alive _quarryUnit) then {
				"quarryMarker" setMarkerAlphaLocal 1;
				"quarryMarker" setMarkerPosLocal getPos _quarryUnit;
				"quarryMarker" setMarkerTextLocal format ["<-- %1", name _quarryUnit];
			} else {
				"quarryMarker" setMarkerAlphaLocal 0;
			};
		}
    };
    
    sleep 1;
    
    _currentTurn = _currentTurn + 1;
};
