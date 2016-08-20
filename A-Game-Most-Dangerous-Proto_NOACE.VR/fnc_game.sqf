

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
	diag_log format["Player %1 was last hit by Player %2",name _victim, name ((_victim getVariable "lastHitBy") select 0)];
	

	
	//if the player is the victim 
	if ( player == _victim ) then {
		//natural cause :) ?
		if ( player == _killer ) then {
			["<t size='0.7' color='#00ff00'>" + "You've been killed by poison or dumbness!" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
			breakOut "playerKilled"; 
		};
		//is it your hunter ?
		_isPlayerQuarry = (_killer getVariable "quarry") select 0;
		if( _isPlayerQuarry == player ) then {
			["<t size='0.7' color='#00ff00'>" + "You've been killed by your hunter !" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		} else {
		    ["<t size='0.7' color='#00ff00'>" + "You've been killed by a random man!" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		};
		breakOut "playerKilled"; 
	};
	
	
	_quarry = (player getVariable "quarry") select 0;
	//if the player is not the killer and not the victim, leave. For the moment no usage for this case
	if ( player != _killer && player != _victim) then {
		breakOut "playerKilled"; 
	};
	//if the player is not the killer, but our quarry is the _victim, we have to get assigned a new quarry
	if ( player != _killer && _quarry == _victim) then {
	     ["<t size='0.7' color='#00ff00'>" + "Your quarry has been killed by another man, you will get a new one assigned. Stand by !" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		player setVariable ["quarry", nil];
		"quarryMarker" setMarkerAlphaLocal 0;
		[player, _victim, _killer] call AssignNewQuarry;
	
		breakOut "playerKilled"; 
	};
		
	//check if you killed your quarry , because then you get points and you get a new quarry
	
	if (player == _killer && _quarry == _victim) then {
		diag_log format["Player %1  killed his quarry ! %2",name _killer, name _victim];
		 ["<t size='0.7' color='#00ff00'>" + "You killed your quarry! You got some antidote prolonging your life a bit." + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
        poisonDamage = 0;
		_oldScore = (player getVariable "score") select 0;
		diag_log format["Player %1 new score is %2",name player, _oldscore + 10];
		player setVariable ["score", [_oldscore + 10]];
		player setVariable ["quarry", nil];
		"quarryMarker" setMarkerAlphaLocal 0;
		_victimOldQuarry = (_victim getVariable "quarry") select 0;
		[player, _victim, _victimOldQuarry] call AssignNewQuarry;
		breakOut "playerKilled"; 
	};
	
	if (player == _killer && _quarry != _victim) then {
		diag_log format["Player %1  killed an innocent player! %2",name _killer, name _victim];
		 ["<t size='0.7' color='#00ff00'>" + "You killed the wrong man ! The poison intensifies its effects !" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
        poisonDamage = poisonDamage + (poisonDamage * 0.5);
		_oldScore = (player getVariable "score") select 0;
		diag_log format["Player %1 new score is %2",name player, _oldscore - 5];
		player setVariable ["score", [_oldscore - 5]];
		breakOut "playerKilled"; 
	};
	
	
	
	
};

PlayerHit = {
	private ["_victim", "_hitter", "_damage"];
	
	_victim = _this select 0;
	_hitter = _this select 1;
	_victim setVariable["lastHitBy", [_hitter], true ];	
};



AssignNewQuarry = {
	private ["_player", "_victim", "_victimOldQuarry", "_quarryUnit","_quarryArray"];
	
	_player = _this select 0;
	_victim = _this select 1;
	_victimOldQuarry = _this select 2;
	if( alive _victimOldQuarry && _player != _victimOldQuarry) then {
		_quarryUnit = _victimOldQuarry;
	} else {
		_quarryUnit =  (allUnits - [_player, _victim, _victimOldQuarry ]) call BIS_fnc_selectRandom;
	};
	_quarryArray = [_quarryUnit];
	
	if( alive _quarryUnit) then {
		_player setVariable["quarry", _quarryArray];
	};
		
	diag_log format["Assigned new Quarry %1 to player %2",name _quarryUnit, name _x];
	
	[format ["<t size='0.7' color='#00ff00'>" + "Your new quarry is %1... Stand by for positioning..." + "</t>", name _quarryUnit], 0, 0, 6, 0] spawn BIS_fnc_dynamicText;

	
};

CheckEndGame = {
	
		//First check if you won 
	if (({alive _x} count allUnits) == 1 && alive player) then {
		[format ["<t size='0.7' color='#00ff00'>" + "You won the Game !!! Your Score is of %1" + "</t>", (player getVariable "score") select 0 ], 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		"Won" call BIS_fnc_endMissionServer;
		
	};
	
	//May be all are dead		
    if (({alive _x} count allUnits) == 0) then {
		[format ["<t size='0.7' color='#00ff00'>" + "You all died !!! Your Score is of %1" + "</t>", (player getVariable "score") select 0 ], 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		"Lost" call BIS_fnc_endMissionServer;
		
	};	

};