private ["_client", "_register", "_email", "_password", "_return", "_hash_split", "_hash", "_salt"];
_client = [_this, 0, "", [""]] call BIS_fnc_param;
_register = [_this, 1, false, [false]] call BIS_fnc_param;

_client call ML_Server_fnc_SQL_Client_Insert;

if(_register)then{
	_email = [_this, 2, "", [""]] call BIS_fnc_param;
	_password = [_this, 3, "", [""]] call BIS_fnc_param;
	_return = ("ML_Server" callExtension (format["1:%1", _password]));
	_hash_split = ([_return, ":"] call BIS_fnc_splitString);
	
	_hash = (_hash_split select 0);
	_salt = (_hash_split select 1);
	[_client, _email, _hash, _salt] call ML_Server_fnc_SQL_Client_Register;
	_client setVariable ["ML_Data_Loaded", true, true];
};
true