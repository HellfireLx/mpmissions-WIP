[] execVM "spawnRandomObjectsFromArray.sqf";
[] execVM "placeVehicles.sqf";
waitUntil {time > 0};
[] execVM "placePlayers.sqf";
[] execVM "assignQuarry.sqf";