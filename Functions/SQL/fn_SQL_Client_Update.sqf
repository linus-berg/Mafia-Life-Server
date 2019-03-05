#include "\ML_Functions\ML_Macros.h"

private ["_client", "_account", "_coins", "_inventory", "_permits",
         "_quests_C", "_quests_F", "_position", "_query", "_family", 
         "_family_inv"];

_client = objectFromNetId([_this, 0, "", [""]] call BIS_fnc_param);
_account = [_client, "ML_Client_Account"] call ML_fnc_Variable_Get;
_account = [_account] call ML_fnc_ToInt;
_coins = [_client, "ML_Client_Coins"] call ML_fnc_Variable_Get;
_coins = [_coins] call ML_fnc_ToInt;
_inventory = _client call ML_fnc_Inventory_Return;
_permits = [_client, "ML_Client_Permits"] call ML_fnc_Variable_Get;
_quests_C = [_client, "ML_Quests_Current"] call ML_fnc_Variable_Get;
_quests_F = [_client, "ML_Quests_Completed"] call ML_fnc_Variable_Get;
_position = getPosATL _client;
_family = [_client, "ML_Family"] call ML_fnc_Variable_Get;
_family_inv = [_client, "ML_Family_Invitations"] call ML_fnc_Variable_Get;

_query = format["1:QUERY_QUOTES:UPDATE client_%1 SET Account = %2, Coins = %3,
                 Inventory = '%4', Permits = '%5', Quests_Current = '%6',
                 Quests_Completed = '%7', Position = '%8'", toLower(Str(side _client)), _account, _coins,
                _inventory, _permits, _quests_C, _quests_F, _position];

if ( (side _client) == Civilian ) then {
    _query = _query + format[", Family = '%1', Family_Invitation = '%2'", 
                             _family, _family_inv];
};

_query = _query + format["WHERE UID = '%1'", (_this select 1)];

("extDB2" callExtension _query)





