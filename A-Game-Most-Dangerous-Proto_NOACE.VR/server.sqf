[] call compileFinal preprocessFileLineNumbers "spawnRandomObjectsFromArray.sqf";
[] call compileFinal preprocessFileLineNumbers "placeVehicles.sqf";
waitUntil {time > 0};
[] call compileFinal preprocessFileLineNumbers "placePlayers.sqf";
[] call compileFinal preprocessFileLineNumbers "assignQuarry.sqf";
[] execVM "checkEndGame.sqf"; 