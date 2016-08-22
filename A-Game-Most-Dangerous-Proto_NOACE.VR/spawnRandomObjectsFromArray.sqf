/* 
	This script spawns items in buildings in a given area. A round or square marker should be present in the mission named "playableArea".
	
*/

private ["_nearBuildings","_pickedBuilding","_possInBuilding","_pickedPosInBuilding","_lootHolder","_lootItems","_alreadypickedBuildings","_maxLootItems"];

	playableAreaRadius =  (getMarkerSize "playableArea") select 0;
	
	//determine how man loot of this kind we want to place according to radius or player count ?
		
	//prepare an array of lootitems.
	_lootItems = [[1,"arifle_MX_f","30Rnd_65x39_caseless_mag"],[2,"DemoCharge_Remote_Mag",""],[1,"srifle_DMR_01_F","10Rnd_762x54_Mag"],[2,"SmokeShell",""],[1,"hgun_rook40_F","16Rnd_9x21_Mag"],[1,"hgun_rook40_F","16Rnd_9x21_Mag"],[1,"SMG_02_F","30Rnd_9x21_Mag_SMG_02"],[1,"hgun_ACPC2_F","9Rnd_45ACP_Mag"],[1,"arifle_Mk20C_ACO_F","30Rnd_556x45_Stanag"],[2,"MiniGrenade",""],[3,"Item_optic_Arco",""],[1,"srifle_GM6_camo_F","5Rnd_127x108_Mag"]];
	
	_nearBuildings =  nearestObjects[getMarkerPos "playableArea", ["House"] , playableAreaRadius]  call BIS_fnc_arrayShuffle;
	
	_maxLootItems = (count _nearBuildings) / 3;
	_alreadypickedBuildings = [];
	_counter = 0;
	//work off the array
while {_counter < _maxLootItems} do {
	
		
		_nearBuildings = _nearBuildings - _alreadypickedBuildings;
		if ((count _nearBuildings) == 0) exitWith {diag_log "no more buildings to put loot into !"};
		_pickedBuilding = _nearBuildings  call BIS_fnc_selectRandom;
		
		
		_possInBuilding = [_pickedBuilding] call BIS_fnc_buildingPositions;
		//if the array is empty we have to pick another building, happens with lamps
		while {count _possInBuilding  == 0} do {
			_pickedBuilding = _nearBuildings call BIS_fnc_selectRandom;
			_possInBuilding = [_pickedBuilding] call BIS_fnc_buildingPositions;
		};
		
		_alreadypickedBuildings = _alreadypickedBuildings + [_pickedBuilding];
		
		_pickedPosInBuilding = _possInBuilding call BIS_fnc_selectRandom;
		//sometimes the position is bullshit, happens in ruins
		while {format ["%1", _pickedPosInBuilding] == "[0,0,0]"} do 
		{
			_pickedPosInBuilding = _possInBuilding call BIS_fnc_selectRandom;
		};
		
		
		//only for debug purpose
		_markerstr = createMarker [format["VictoryItem_%1",_counter],_pickedPosInBuilding];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "hd_dot";
		diag_log format["Found position %1 in building %2 at position %3 from %4 possible buildings, marked on map", _pickedPosInBuilding, _pickedBuilding, getPos _pickedBuilding, count _nearBuildings];  
		
		//actual code
		//TODO use grounDweaponholder for weapons and ammo
		_lootHolder = createVehicle ["groundweaponholder", [0,0,0], [], 0, "CAN_COLLIDE"];
		_lootItemtoPlace = _lootItems call BIS_fnc_selectRandom;
		switch (_lootItemtoPlace select 0) do {
			case 1: { // weapon 
				_lootHolder addWeaponCargoGlobal[_lootItemtoPlace select 1, 1];
				_lootHolder addMagazineCargoGlobal[_lootItemtoPlace select 2, 2];
			};
			case 2: {// explosives
				_lootHolder addMagazineCargoGlobal[_lootItemtoPlace select 1, 1];
			};		
			case 3: {// items
				_lootHolder addItemCargoGlobal[_lootItemtoPlace select 1, 1];
			};
		 
		};
		_lootHolder setPos _pickedPosInBuilding;
		
		_counter = _counter + 1;
	};

	
	
