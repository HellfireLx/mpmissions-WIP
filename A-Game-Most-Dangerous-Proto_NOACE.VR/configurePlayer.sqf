

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


//add important eventhandlers, for testing purpose with AI we add it to all units, dirty but works
{
	_x addMPEventHandler ["MPHit", {_this call PlayerHit;}];
    _x addMPEventHandler ["MPKilled", {_this call PlayerKilled;_this call CheckEndGame}];
} forEach allUnits;



//player addMPEventHandler ["MPHit", {_this call PlayerHit;}];
//player addMPEventHandler ["MPKilled", {_this call PlayerKilled;}];
player setVariable ["score", [0]];
	
	
//give every player some clothing
player forceadduniform _playeruniforms;

// give players some items
// removeBackpack player;
// removeAllWeapons player;
// removeAllItemsWithMagazines player;
 removeAllAssignedItems player;
// player addVest "V_BandollierB_blk";
 player addItem "ItemGPS";    
 player assignItem "ItemGPS";
 player addItemToUniform "FirstAidKit";
// player addItemToUniform "ACE_morphine";

//for testing purpose
[player, "hgun_Rook40_snds_F", 1] call BIS_fnc_addWeapon;
"quarryMarker" setMarkerAlphaLocal 0;
//send in message when player gets quarry
waitUntil{ !isNull ((player getVariable "quarry") select 0)};
[format ["<t size='0.7' color='#00ff00'>" + "Your quarry is %1... Stand by for positioning..." + "</t>", name ((player getVariable "quarry") select 0)], 0, 0, 6, 0] spawn BIS_fnc_dynamicText;
