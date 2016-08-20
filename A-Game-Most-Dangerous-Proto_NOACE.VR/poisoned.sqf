private ["_updating","_minutesLeft","_damagePerTurn","_turnTime","_totalDurationMinutes","_turnsPerMinute","_turnsPast","_notificationX","_notificationY","_notificationColor"];

_updating = true;
poisonDamage = 0;
// Minutes that poison takes to do 100% damage
_totalDurationMinutes = 5.0;
_turnsPerMinute = 12.0;
_turnTime = 60.0 / _turnsPerMinute;

_damagePerTurn = 1.0 / (_totalDurationMinutes * _turnsPerMinute);

_turnsPast = 0;

while {_updating && poisonDamage < 1.0} do {
    sleep _turnTime;
       
	
    
    poisonDamage = poisonDamage + _damagePerTurn;    
	
	diag_log format ["Poison damage to %1 of %2!", player, poisonDamage] ;
       
	_minutesLeft = round ((1.0 - poisonDamage) / (_damagePerTurn * _turnsPerMinute));
	
	_turnsPast = _turnsPast + 1;
	
	_notificationX = -0.7;
	_notificationY = 0.9;
	_notificationColor = "#FFAA1111";
	if ((_turnsPast >= _turnsPerMinute) && (alive player)) then {
		if (_minutesLeft > 1) then {
			[format ["<t size='0.7' color='" + _notificationColor + "'>" + "The poison is taking its toll. You have %1 minutes left to live." + "</t>", _minutesLeft],_notificationX,_notificationY,6,0] spawn BIS_fnc_dynamicText;
		} else {
			["<t size='0.7' color='" + _notificationColor + "'>" + "The poison is taking its toll... you have less than a minute to live." + "</t>",_notificationX,_notificationY,6,0] spawn BIS_fnc_dynamicText;
		};
		
		_turnsPast = 0;
	
	};
    
   
};

["<t size='1.0' color='#ff0000'>" + "You were killed by the poison!" + "</t>",0,0,6,0] spawn BIS_fnc_dynamicText;
player setVariable ["lastHitter", player, true];
player setDamage 1.0;
poisonDamage = 0;


