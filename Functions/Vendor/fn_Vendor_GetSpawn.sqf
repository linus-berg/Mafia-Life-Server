#include "\ML_Functions\ML_Macros.h"

private ["_type", "_object", "_tag"];
_type = [_this, 0, 0, [0]] call BIS_fnc_param;
_object = [_this, 1, "", [""]] call BIS_fnc_param;
_tag = "ML_Vendor_%1_%2";

if ( _object == "" )exitWith{
	false
};

switch _type do{
	case 0: {
		_object = format[_tag, "Box", _object];
	};
	case 1: {
		_object = format[_tag, "Spawn", _object];
	};
};

(netId(missionNamespace getVariable _object))