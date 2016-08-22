private ["_swap", "_allUnitsTargets","_allINDUnitsTargets"];

//build a list of only Independant

_allINDUnitsTargets = [];
{
	if ((faction _x) == "IND_F") then {
		_allINDUnitsTargets = _allINDUnitsTargets + [_x];
	};
} forEach allUnits;

_allUnitsTargets = +_allINDUnitsTargets;
//diag_log format["before shuffled : %1",_allUnitsTargets ]; 
//Using Sattolo's Algorithm
for [{_i=(count _allUnitsTargets - 1)}, {_i > 0}, {_i=_i-1}] do
{
	
    _r = floor(random _i);
	diag_log format["random pos _r : %1",_r];
	_swap = _allUnitsTargets select _r;
	_allUnitsTargets set [_r, _allUnitsTargets select _i];
	_allUnitsTargets set [ _i, _swap];
   //diag_log format["swapped  %1 to index %2, %3 goes to index %4", _swap, _i,  (_allUnitsTargets select _r), _r];
};
//diag_log format["shuffled : %1",_allUnitsTargets ];
//assign the quarries

{
	(_allINDUnitsTargets select _foreachindex) setVariable["quarry", (_allUnitsTargets select _foreachindex), true];
	 diag_log format["Assigned Quarry %1 to player %2, number %3", (_allUnitsTargets select _foreachindex),  (_allINDUnitsTargets select _foreachindex), _foreachindex];
	
} forEach _allINDUnitsTargets;



