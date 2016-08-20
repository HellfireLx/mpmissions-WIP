

//[] execVM "debugThread.sqf";   

[] execVM "fnc_game.sqf";

if (hasInterface) then {
     [] execVM "player.sqf";   
};

if (isServer) then {
	 [] execVM "server.sqf";   
};



diag_log  "init done!";