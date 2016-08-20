private ["_lastUnit", "_allUnitsTargets"];

_allUnitsTargets = +allUnits;
//Using Sattolo's Algorithm
for [{_i=count _allUnitsTargets}, {_i > 1}, {_i=_i-1}] do
{
    _r = floor(random (_i-1));
	_swap = _allUnitsTargets select _r;
	_allUnitsTargets set [_r, _allUnitsTargets select (_i-1)];
	_allUnitsTargets set [ _i-1, _swap];
	//set the quarry
	 _quarryArray = [_swap];
	 (allUnits select (_i-1)) setVariable["quarry", _quarryArray];
	 diag_log format["Assigned Quarry %1 to player %2, number %3",name _swap, name (allUnits select (_i-1)), _i-1];
};
// don't forget the first element 
_quarryArray = [_allUnitsTargets select 0];
(allUnits select 0) setVariable["quarry", _quarryArray];
diag_log format["Assigned Quarry %1 to player %2, number %3",name (_allUnitsTargets select 0), name (allUnits select 0), 0];


