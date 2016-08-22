
waitUntil {time > 0 && !isNull player};



switch (playerSide) do {
    case west: {
        [] call compileFinal preprocessFileLineNumbers "configurePolicePlayer.sqf";
		[] execVM "updatePoliceMarkers.sqf";
    };
    default {
		[] call compileFinal preprocessFileLineNumbers "configurePlayer.sqf";
		[] execVM "updateMarkers.sqf";
		[] execVM "poisoned.sqf";
		[] call LimitPlayerMovement;
	};
};




