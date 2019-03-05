#include "\ML_Functions\ML_Macros.h"

private ["_client", "_account", "_coins", "_inventory", "_permits",
         "_quests_C", "_quests_F", "_position", "_query"];

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

_query = format[
    "1:QUERY_QUOTES:INSERT INTO client_%1 (UID, Account, Coins, 
     Inventory, Permits, Quests_Current, Quests_Completed, Position ",
    toLower(Str(side _client))];

if ((side _client) == Civilian) then {
    _query = _query + ", Family, Family_Invitation ";
};

_query = _query + format[") VALUES('%1', %2, %3, '%4', '%5', '%6', '%7', '%8'",
                         getPlayerUID(_client), _account, _coins, _inventory,
                         _permits, _quests_C, _quests_F, _position];

if ((side _client) == Civilian) then {
  private["_family", "_family_inv"];
  _family = [_client, "ML_Family"] call ML_fnc_Variable_Get;
  _family_inv = [_client, "ML_Family_Invitations"] call ML_fnc_Variable_Get;
  _query = _query + format[", '%1', '%2')", _family, _family_inv];

} else {
  _query = _query + ")";
};

return ("extDB2" callExtension _query)





