

PlayerKilled = {
	private ["_victim", "_killer","_oldScore"];
	// this should be executed on clients only;
	if (!hasInterface) exitWith { true };
	_victim = _this select 0;
	_killer = _this select 1;
	//Ace gives us another way to find the killer, if Vanilla can't determine
	_killer = if (isNull _killer) then {
		diag_log format["Had to check ace_medical_lastDamageSource !"];
       _unit getVariable ["ace_medical_lastDamageSource", _killer];
   } else { _killer };
	
	
	
	scopeName "playerKilled";
	diag_log format["Player %1 was killed by Player %2",name _victim, name _killer];
	diag_log format["Player %1 was last hit by Player %2",name _victim, name (_victim getVariable "lastHitBy")];
	

	
	//if the player is the victim 
	if ( player == _victim ) then {
		//natural cause :) ?
		if ( player == _killer ) then {
			["<t size='0.7' color='#00ff00'>" + "You've been killed by poison or dumbness!" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
			breakOut "playerKilled"; 
		};
		//is it your hunter ?
		_isPlayerQuarry = _killer getVariable "quarry";
		if( _isPlayerQuarry == player ) then {
			["<t size='0.7' color='#00ff00'>" + "You've been killed by your hunter !" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		} else {
		    ["<t size='0.7' color='#00ff00'>" + "You've been killed by a random man!" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		};
		breakOut "playerKilled"; 
	};
	
	
	_quarry = player getVariable "quarry";
	//if the player is not the killer and not the victim, leave. For the moment no usage for this case
	if ( player != _killer && player != _victim) then {
		breakOut "playerKilled"; 
	};
	//if the player is not the killer, but our quarry is the _victim, we have to get assigned a new quarry
	if ( player != _killer && _quarry == _victim) then {
	     ["<t size='0.7' color='#00ff00'>" + "Your quarry has been killed by another man, you will get a new one assigned. Stand by !" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		player setVariable ["quarry", nil, true];
		"quarryMarker" setMarkerAlphaLocal 0;
		[player, _victim, _killer] call AssignNewQuarry;
	
		breakOut "playerKilled"; 
	};
		
	//check if you killed your quarry , because then you get points and you get a new quarry
	
	if (player == _killer && _quarry == _victim) then {
		diag_log format["Player %1  killed his quarry ! %2",name _killer, name _victim];
		 ["<t size='0.7' color='#00ff00'>" + "You killed your quarry! You got some antidote prolonging your life a bit." + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
        poisonDamage = 0;
		_oldScore = player getVariable "score";
		diag_log format["Player %1 new score is %2",name player, _oldscore + 10];
		player setVariable ["score", (_oldscore + 10), true];
		player setVariable ["quarry", nil, true];
		"quarryMarker" setMarkerAlphaLocal 0;
		_victimOldQuarry = _victim getVariable "quarry";
		[player, _victim, _victimOldQuarry] call AssignNewQuarry;
		breakOut "playerKilled"; 
	};
	
	if (player == _killer && _quarry != _victim) then {
		diag_log format["Player %1  killed an innocent player! %2",name _killer, name _victim];
		if ( { (faction _x) == "BLU_F" } count allUnits > 0) then {
		    player setVariable ["wanted", 1, true];
			["<t size='0.7' color='#00ff00'>" + "You killed the wrong man ! The cops are going to come for you !" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		} else {
			["<t size='0.7' color='#00ff00'>" + "You killed the wrong man ! The poison intensifies its effects !" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
			poisonDamage = poisonDamage + (poisonDamage * 0.5);
		};
		
		
		_oldScore = player getVariable "score" ;
		diag_log format["Player %1 new score is %2",name player, _oldscore - 5];
		player setVariable ["score", (_oldscore - 5), true];
		breakOut "playerKilled"; 
	};
	
	
	
	
};

PlayerHit = {
	private ["_victim", "_hitter", "_damage"];
	
	_victim = _this select 0;
	_hitter = _this select 1;
	_victim setVariable["lastHitBy", _hitter, true ];	
};



AssignNewQuarry = {
	private ["_player", "_victim", "_victimOldQuarry", "_quarryUnit","_allIndUnitsTargets"];
	
	_player = _this select 0;
	_victim = _this select 1;
	_victimOldQuarry = _this select 2;
	diag_log format["victim's quarry was %1",name _victimOldQuarry];
	if( alive _victimOldQuarry && _player != _victimOldQuarry) then {
		_quarryUnit = _victimOldQuarry;
	} else {
		_allIndUnitsTargets = [];
		{
			if ((faction _x) == "IND_F") then {
				_allIndUnitsTargets = _allIndUnitsTargets + [_x];
			};
		} forEach allUnits;
		_quarryUnit =  (_allIndUnitsTargets - [_player, _victim, _victimOldQuarry ]) call BIS_fnc_selectRandom;
	};
	
	
	if( alive _quarryUnit) then {
		_player setVariable["quarry", _quarryUnit, true];
	};
		
	diag_log format["Assigned new Quarry %1 to player %2",name _quarryUnit, name _x];
	
	[format ["<t size='0.7' color='#00ff00'>" + "Your new quarry is %1... Stand by for positioning..." + "</t>", name _quarryUnit], 0, 0, 6, 0] spawn BIS_fnc_dynamicText;

	
};

CheckEndGame = {
	private ["_victim", "_killer","_allIndUnitsTargets"];
	
	_allIndUnitsTargets = [];
		{
			if ((faction _x) == "IND_F") then {
				_allIndUnitsTargets = _allIndUnitsTargets + [_x];
			};
		} forEach allUnits;

	diag_log format["Remaing units: %1 ",_allIndUnitsTargets];
		//First check if you won 
	if (({alive _x} count _allIndUnitsTargets) == 1 && alive player) then {
		[format ["<t size='0.7' color='#00ff00'>" + "You won the Game !!! Your Score is %1" + "</t>", player getVariable "score" ], 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		 // ["end1", false] remoteExec ["BIS_fnc_endMission"]
		"GameOver" call BIS_fnc_endMissionServer;
		
	};
	
	if (({alive _x} count _allIndUnitsTargets) == 1 && !alive player) then {
		[format ["<t size='0.7' color='#00ff00'>" + "Game Over ! Your Score is %1" + "</t>", player getVariable "score" ], 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		 // ["end1", false] remoteExec ["BIS_fnc_endMission"]
		"GameOver" call BIS_fnc_endMissionServer;
		
	};
	
	//May be all are dead		
    if (({alive _x} count _allIndUnitsTargets) == 0) then {
		[format ["<t size='0.7' color='#00ff00'>" + "You all died !!! Your Score is %1 " + "</t>", player getVariable "score" ], 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		// ["end1", false] remoteExec ["BIS_fnc_endMission"]
		"GameOver" call BIS_fnc_endMissionServer;
		
	};	

};