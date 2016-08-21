
waitUntil {time > 0 && !isNull player};
switch (playerSide) do {
    case west: {
        [] execVM "configurePolicePlayer.sqf";
		[] execVM "updatePoliceMarkers.sqf";
    };
    default {
		[] execVM "configurePlayer.sqf";
		[] execVM "updateMarkers.sqf";
		[] execVM "poisoned.sqf";
	};
};




