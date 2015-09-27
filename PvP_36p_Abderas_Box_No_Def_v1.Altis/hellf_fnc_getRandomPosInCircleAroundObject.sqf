//  In: position  , radius
// Out: position
//modified by hellfire to just take a position and size
// Center point
private ["_centerPos", "_centerX","_centerY"];
_centerPos = getPos (_this select 0);
_centerX = _centerPos select 0;
_centerY = _centerPos select 1;

// Size
private ["_size"];
_size  = _this select 1;

// Randomly pick a direction, 
private ["_dir","_posX","_posY","_rand","_pos"];
_dir  = random 360;
_rand = sqrt random 1;
_posX = (_size * (cos _dir)) * _rand;
_posY = (_size * (sin _dir)) * _rand;
_pos  = [_posX,_posY];

_posX = _centerX + (_pos select 0);
_posY = _centerY + (_pos select 1);

[_posX,_posY,0]
