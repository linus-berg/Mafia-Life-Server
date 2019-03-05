private["_client", "_data"];
_client = ([_this, 1, "", [""]] call BIS_fnc_param);
[_client, [format["Syncing data for %1.", name ObjectFromNetID(_client)], ["FF8C00", 1]]] call ML_Server_fnc_Network_Notify;
_data = _client call ML_Server_fnc_SQL_Client_Retrieve;
diag_log format["CLIENT: %1 DATA: %2", _client, _data];
if ((count _data) == 0) exitWith {
	_client call ML_Server_fnc_Data_Set;
};
[_client, (_data select 0)] call ML_Server_fnc_Data_Load;
