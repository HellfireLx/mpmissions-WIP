

//[] execVM "debugThread.sqf";   

[] execVM "fnc_game.sqf";

if (isServer) then {
	[] execVM "server.sqf";   
};


if (hasInterface) then {
     [] execVM "player.sqf";   
};





diag_log  "init done!";