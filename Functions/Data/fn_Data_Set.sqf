private["_client", "_return"];
_client = objectFromNetID([_this, 0, "", [""]] call BIS_fnc_param);
[_this, [format["No data for %1.", name ObjectFromNetID(_this)], ["FF8C00", 1, 2]]] call ML_Server_fnc_Network_Notify;
[_client, "ML_Client_Account", (3000 call ML_fnc_ToASCII)] call ML_fnc_Variable_Init;
[_client, "ML_Client_Coins", (3000 call ML_fnc_ToASCII)] call ML_fnc_Variable_Init;
[_client, "ML_Client_Permits", []] call ML_fnc_Variable_Init;
[_client, "ML_Quests_Current", []] call ML_fnc_Variable_Init;
[_client, "ML_Quests_Completed", []] call ML_fnc_Variable_Init;
[_client, "ML_Family", [0,0]] call ML_fnc_Variable_Init;
[_client, "ML_Family_Invitations", []] call ML_fnc_Variable_Init;

_return = (_client call ML_Server_fnc_SQL_Client_Account);

if(_return)exitWith{
	["ML_Network_Client_Data_Register", _return, netId(_client)] call ML_Server_fnc_Network_ServerToClient;
};
_client setVariable ["ML_Data_Loaded", true, true];
[netId(_client), false] call ML_Server_fnc_Data_Register;
true