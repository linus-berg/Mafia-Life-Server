#include "\ML_Functions\ML_Macros.h"

private ["_unit", "_uid", "_name"];
_unit = (_this select 0);
_uid = (_this select 1);
_name = (_this select 2);
if(!(_unit getVariable ["ML_Data_Loaded", false]))exitWith{
	ML_LOG(_name + " disconnected before loaded, his data will not be updated.")
	false
};
ML_LOG("Player disconnected. Name: " + _name + " UID: " + _uid)
[netId(_unit), _uid] call ML_Server_fnc_SQL_Client_Update;

false
