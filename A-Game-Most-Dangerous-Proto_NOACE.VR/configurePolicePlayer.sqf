
private ["_allBLUUnitsTargets"];

//add important eventhandlers, for testing purpose with AI we add it to all units, dirty but works
_allBLUUnitsTargets = [];
{
	if ((faction _x) == "BLU_F") then {
		_allBLUUnitsTargets = _allBLUUnitsTargets + [_x];
	};
} forEach allUnits;

 {
	 _x addMPEventHandler ["MPHit", {_this call PlayerHit}];
     _x addMPEventHandler ["MPKilled", {_this call PlayerKilled}];
 } forEach _allBLUUnitsTargets;



//player addMPEventHandler ["MPHit", {_this call PlayerHit}];
//player addMPEventHandler ["MPKilled", {_this call PlayerKilled}];
//player setVariable ["score", [0]];
	

// give police players some items -- all object should be uniform and given in mission editor by loadout

"quarryMarker" setMarkerAlphaLocal 0;

["<t size='0.7' color='#00ff00'>" + "A beautiful day to uphold the Law..." + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
