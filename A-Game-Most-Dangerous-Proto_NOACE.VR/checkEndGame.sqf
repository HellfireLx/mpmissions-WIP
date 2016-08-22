
if (!isServer) exitWith { diag_log "Not a server, weird ..."; };

_CheckEndGame = {
	private ["_gameOver","_allIndUnitsTargets"];
	
	diag_log "Check End Game Start";
	_gameOver = false;
	
	_allIndUnitsTargets = [];
		{
			if ((faction _x) == "IND_F") then {
				_allIndUnitsTargets = _allIndUnitsTargets + [_x];
				diag_log format["Remaining IND unit %1 ",_x];
			};
		} forEach allUnits;
		

	//First check if there is only one left alive
	if (({alive _x} count _allIndUnitsTargets) == 1) then {
			
	     [name (_allIndUnitsTargets select 0)] remoteExec ["EndOfGame"]; 
		
		_gameOver = true;
		
	};
	

	//May be all are dead		
    if (({alive _x} count _allIndUnitsTargets) == 0) then {
		"Nobody" remoteExec ["EndOfGame"]; 
		_gameOver = true;
	
	};	
	diag_log "Check End Game End";
	_gameOver
};

private ["_gameOver"];
_gameOver = false;
while { !_gameOver } do {
	//let's be economical
	uiSleep 2;
	_gameOver = [] call _CheckEndGame;
};
uiSleep 2;
"GameOver" call BIS_fnc_endMissionServer;

