private["_client"];
diag_log format["Sync Data: %1", _this];
_client = ObjectFromNetId([_this, 1, "", [""]] call BIS_fnc_param);
if(isNull _client)exitWith{false};
if(!alive _client)exitWith{false};
[(_this select 1), ["Client data synced.", ["FF8C00", 1, 1]]] call ML_Server_fnc_Network_Notify;
[netId(_client), getPlayerUID(_client)] call ML_Server_fnc_SQL_Client_Update;
