/* 
	This script spawns a random box in a house around a given position
	Then it puts a download action on that box using the downloadata.sqf scipt
	//TODO if concept is accepted, clean up code and functions
*/

private ["_nearBuildings","_pickedBuilding","_possInBuilding","_pickedPosInBuilding","_victoryBox"];

if !(isServer) exitWith {};

waitUntil { !isNil "T8L_var_INITDONE" };



waitUntil {!isnil "bis_fnc_init";time>1;!isNil "T8L_var_INITDONE"};
		
	//[9432.1494,119.92252,20236.951] coordinates taking from a marker area, watch out inversion of y and z axis
	//TODO use a marker and its position and radius
	_nearBuildings = (nearestObjects [[9432.1494,20236.951,119.92252], ["House"] , 200 ]) call BIS_fnc_arrayShuffle;
	_pickedBuilding = _nearBuildings call BIS_fnc_selectRandom;
	_possInBuilding = [_pickedBuilding] call BIS_fnc_buildingPositions;
	//if the array is empty we have to pick another building, happens with lamps
	while {count _possInBuilding  == 0} do {
		_pickedBuilding = _nearBuildings call BIS_fnc_selectRandom;
		_possInBuilding = [_pickedBuilding] call BIS_fnc_buildingPositions;
	};
	_pickedPosInBuilding = _possInBuilding call BIS_fnc_selectRandom;
	//sometimes the position is bullshit, happens in ruins
	while {format ["%1", _pickedPosInBuilding] == "[0,0,0]"} do 
	{
		_pickedPosInBuilding = _possInBuilding call BIS_fnc_selectRandom;
	};
	
	
	//only for debug purpose
	//_markerstr = createMarker ["VictoryItem",_pickedPosInBuilding];
    //_markerstr setMarkerShape "ICON";
    //_markerstr setMarkerType "hd_dot";
	//[format["Found position %1 in building %2 at position %3 from %4 possible buildings, marked on map", _pickedPosInBuilding, _pickedBuilding, getPos _pickedBuilding, count _nearBuildings],"hint",true,true] call BIS_fnc_MP;  
	
	//actual code
	_victoryBox = createVehicle ["Box_IND_Ammo_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	clearMagazineCargoGlobal _victoryBox;
	clearWeaponCargoGlobal _victoryBox;
	_victoryBox setPos _pickedPosInBuilding;
	
	//add the download data action
	[ [ _victoryBox ], "T8L_fnc_addActionLaptop", true, true] spawn BIS_fnc_MP;
