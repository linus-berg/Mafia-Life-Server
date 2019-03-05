private["_eventType", "_params", "_owner"];
_eventType = ([_this, 0, "", [""]] call BIS_fnc_param);
_params = (_this select 1);
_owner = owner (objectFromNetId([_this, 2, "", [""]] call BIS_fnc_param));
diag_log format["_client %1, _client (OBJ): %2, _owner: %3",_this select 2, objectFromNetId(_this select 2), _owner];

ML_Network_Client = [_eventType, _params];
_owner publicVariableClient "ML_Network_Client";