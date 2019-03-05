private ["_families", "_family", "_i"];
_families = [];
for "_i" from 0 to (count _this)-1 do{
	_family = (_this select _i);
	_family pushBack grpNull;
	_families pushBack (_family select 0);
	ML_Family setVariable [str(_family select 0), _family, true];
};

ML_Family setVariable ["ML_Families", _families, true];
