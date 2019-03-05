private ["_client", "_data", "_account", "_coins", "_inventory", "_permits", "_quests_c", "_quests_completed", "_position", "_family", "_family_inv"];

_client = objectFromNetId([_this, 0, "", [""]] call BIS_fnc_param);
_data = ([_this, 1, [], [[]]] call BIS_fnc_param);
_account = ([_data, 0, 0, [0]] call BIS_fnc_param);
_coins = ([_data, 1, 0, [0]] call BIS_fnc_param);
_inventory = ([_data, 2, [], [[]]] call BIS_fnc_param);
_permits = ([_data, 3, [], [[]]] call BIS_fnc_param);
_quests_c = ([_data, 4, [], [[]]] call BIS_fnc_param);
_quests_completed = ([_data, 5, [], [[]]] call BIS_fnc_param);
_position = ([_data, 6, [], [[]]] call BIS_fnc_param);
_family = ([_data, 7, [], [[]]] call BIS_fnc_param);
_family_inv = ([_data, 8, [], [[]]] call BIS_fnc_param);
if((_family select 0) != 0)then{
	[netId(_client), _family] call ML_Server_fnc_Family_Set;
};
[_client, "ML_Client_Account", (_account call ML_fnc_ToASCII)] call ML_fnc_Variable_Init;
[_client, "ML_Client_Coins", (_coins call ML_fnc_ToASCII)] call ML_fnc_Variable_Init;
[_client, "ML_Client_Permits", _permits] call ML_fnc_Variable_Init;
[_client, "ML_Quests_Current", _quests_c] call ML_fnc_Variable_Init;
[_client, "ML_Quests_Completed", _quests_completed] call ML_fnc_Variable_Init;
[_client, "ML_Family", _family] call ML_fnc_Variable_Init;
[_client, "ML_Family_Invitations", _family_inv] call ML_fnc_Variable_Init;

_return = (_client call ML_Server_fnc_SQL_Client_Account);

if(_return)then{
	["ML_Network_Client_Data_Register", _return, netId(_client)] call ML_Server_fnc_Network_ServerToClient;
};
["ML_Network_Client_Data_Return", [_inventory, _position], netId(_client)] call ML_Server_fnc_Network_ServerToClient;