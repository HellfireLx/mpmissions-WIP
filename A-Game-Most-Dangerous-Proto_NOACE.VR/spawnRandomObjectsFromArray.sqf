/* 
	This script spawns items in buildings in a given area. A round or square marker should be present in the mission named "playableArea".
	
*/

private ["_nearBuildings","_pickedBuilding","_possInBuilding","_pickedPosInBuilding","_lootHolder"];

	playableAreaRadius =  (getMarkerSize "playableArea") select 0;
	
	//determine how man loot of this kind we want to place according to radius or player count ?
		
	//prepare an array of lootitems.
	_lootItems = ["arifle_MX_f"];
	_lootItemsMagazines = ["30Rnd_65x39_caseless_mag"];
	
	_counter = 0;
	//work off the array
while {_counter < (count _lootItems)} do {
	
		_nearBuildings =  nearestObjects[getMarkerPos "playableArea", ["House"] , playableAreaRadius] call BIS_fnc_arrayShuffle;
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
		_markerstr = createMarker ["VictoryItem",_pickedPosInBuilding];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "hd_dot";
		diag_log format["Found position %1 in building %2 at position %3 from %4 possible buildings, marked on map", _pickedPosInBuilding, _pickedBuilding, getPos _pickedBuilding, count _nearBuildings];  
		
		//actual code
		//TODO use grounDweaponholder for weapons and ammo
		_lootHolder = createVehicle ["groundweaponholder", [0,0,0], [], 0, "CAN_COLLIDE"];
		_lootHolder addWeaponCargoGlobal[_lootItems select _counter ,1];
		_lootHolder addMagazineCargoGlobal[_lootItemsMagazines select _counter,2];
		_lootHolder setPos _pickedPosInBuilding;
		
		_counter = _counter + 1;
	};

	
	
