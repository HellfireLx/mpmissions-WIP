

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
	
    //somebody dies , if you are a cop let's make sure the marker goes
	if ((faction player) == "BLU_F" ) then {
		_wantedMarkerName = format["wantedMarker_%1",  str _victim];
		(str _wantedMarkerName) setMarkerAlphaLocal 0;
	};
	
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
	// if ( player != _killer && player != _victim) then {
		// breakOut "playerKilled"; 
	// };
	//if the player is not the killer, but our quarry is the _victim, we have to get assigned a new quarry
	if ( player != _killer && _quarry == _victim) then {
	     ["<t size='0.7' color='#00ff00'>" + "Your quarry has been killed by another man, you will get a new one assigned. Stand by !" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
		player setVariable ["quarry", nil, true];
		"quarryMarker" setMarkerAlphaLocal 0;
		[player, _victim, _killer] spawn AssignNewQuarry;
	
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
		[player, _victim, _victimOldQuarry] spawn AssignNewQuarry;
		breakOut "playerKilled"; 
	};
	
	if (player == _killer && _quarry != _victim) then {
		diag_log format["Player %1  killed an innocent player! %2",name _killer, name _victim];
		if ( { (faction _x) == "BLU_F" } count allUnits > 0) then {
		    player setVariable ["wanted", 1, true];
			["<t size='0.7' color='#00ff00'>" + "You killed the wrong man ! Bad boy, bad boy, Watcha gonna do, whatcha gonna do when they come for you ?  " + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
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
	
	uiSleep 3;
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
	
	
	if( isNil "_quarryUnit" ) exitWith {
		diag_log "no quarry left ? The game is over ! Let the server sort it out.";
		poisonDamage = 0.0;
		_player setVariable["quarry", nil, true];
	};
	
	if(!alive _quarryUnit) exitWith {
		//quarry dead ? may be we should choose a new one
		[_player, _victim, null] spawn AssignNewQuarry;
	};
	
	_player setVariable["quarry", _quarryUnit, true];
		
	diag_log format["Assigned new Quarry %1 to player %2",name _quarryUnit, name _player];
	
	[format ["<t size='0.7' color='#00ff00'>" + "Your new quarry is %1... Stand by for positioning..." + "</t>", name _quarryUnit], 0, 0, 6, 0] spawn BIS_fnc_dynamicText;

	
};


LimitPlayerMovement = {
    inPlayArea = true;
    
    private ["_playAreaPosition","_playAreaSize","_tr1"];
    _playAreaPosition = getMarkerPos "playableArea";
    _playAreaSize = getMarkerSize "playableArea";
    
    format ["%1, %2", _playAreaPosition, _playAreaSize] call BIS_fnc_log;
    
    _tr1 = createTrigger["EmptyDetector", _playAreaPosition];
    
	 
    _tr1 setTriggerArea [_playAreaSize select 0, _playAreaSize select 1, 0, markerShape "playableArea" ==  "RECTANGLE"];   
    
    _tr1 setTriggerStatements [
        "this",
        "[] call PlayerInBounds",
        "[] call PlayerOutOfBounds"
    ];
    _tr1 triggerAttachVehicle [player];
    
};

PlayerOutOfBounds = {
    diag_log format["Player %1 out...", name player];
    
    inPlayArea = false;    
    
    [] execVM "monitorPlayerPosition.sqf";
};

PlayerInBounds = {
    if ((!inPlayArea) && (alive player)) then {
        ["TaskSucceeded",["","Return to play area."]] call BIS_fnc_showNotification;
    };
    
    inPlayArea = true;
};

EndOfGame = {
	private ["_message"];
	_message = _this select 0;
	if ((faction player) == "BLU_F" ) then {
		["<t size='0.7' color='#00ff00'>" + _message + " won the Game ! Thanks for serving the Law !" + "</t>", 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
	} else {
		[format ["<t size='0.7' color='#00ff00'>" + _message + " won the Game ! Your Score is %1 points" + "</t>", player getVariable "score" ], 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
	};
	
    
};