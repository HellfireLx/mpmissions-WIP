

uisleep 5;

if (alive player) then {
	if (!inPlayArea) then {
		["TaskAssigned",["","You have 10 seconds to return to the play area ! "]] call BIS_fnc_showNotification;
	};
	
	uisleep 10;
	
	if (!inPlayArea) then {
		player setDamage 1.0;
	};
};
