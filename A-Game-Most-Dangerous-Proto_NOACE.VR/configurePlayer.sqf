private ["_playeruniforms","_allINDUnitsTargets"];

_playeruniforms = [
            "U_C_Journalist",
            "U_C_Poloshirt_blue",
            "U_C_Poloshirt_burgundy",
            "U_C_Poloshirt_salmon",
            "U_C_Poloshirt_stripped",
            "U_C_Poloshirt_tricolour",
            "U_C_Poor_1",
            "U_C_Poor_2",
            "U_C_Poor_shorts_1",
            "U_C_Scientist",
            "U_OrestesBody",
            "U_Rangemaster",
            "U_NikosAgedBody",
            "U_NikosBody",
            "U_Competitor",
            "U_C_HunterBody_grn"
] call BIS_fnc_selectRandom;


_allINDUnitsTargets = [];
{
	if ((faction _x) == "IND_F") then {
		_allINDUnitsTargets = _allINDUnitsTargets + [_x];
	};
} forEach allUnits;

//add important eventhandlers, for testing purpose with AI we add it to all units, dirty but works
{
	 _x addMPEventHandler ["MPHit", {_this call PlayerHit;}];
     _x addMPEventHandler ["MPKilled", {_this call PlayerKilled;}];
	 _x setVariable ["wanted", 0, true];
 } forEach _allINDUnitsTargets;

diag_log format["configuring player: %1", name player];




//player addMPEventHandler ["MPHit", {_this call PlayerHit}];
//player addMPEventHandler ["MPKilled", {_this call PlayerKilled;_this call CheckEndGame}];
player setVariable ["score", 0];
// your record is clear;
//player setVariable ["wanted", 0];
	
	
//give every player some clothing


comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceadduniform _playeruniforms;

player addItemToUniform "FirstAidKit";
player addBackpack "B_FieldPack_blk";

comment "Add weapons";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";



//for testing purpose
[player, "hgun_Rook40_F", 1] call BIS_fnc_addWeapon;

[player] joinSilent grpNull;

"quarryMarker" setMarkerAlphaLocal 0;
//send in message when player gets quarry
waitUntil{ !isNull (player getVariable "quarry")};
[format ["<t size='0.7' color='#00ff00'>" + "Your quarry is %1... Stand by for a GPS position..." + "</t>", name (player getVariable "quarry")], 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
