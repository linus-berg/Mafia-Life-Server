#include "\ML_Functions\ML_Macros.h"

private["_client", "_query", "_return_id", "_pipe", "_queryResult"];
_client = objectFromNetId([_this, 0, "", [""]] call BIS_fnc_param);

_query = "2:QUERY_QUOTES:SELECT Account, Coins, Inventory, Permits,
          Quests_Current, Quests_Completed, Position";

if ( (side _client) == Civilian ) then {
    _query = _query + ", Family, Family_Invitation";
};

_query = _query + format[" FROM client_%1 WHERE UID = '%2'",
                         toLower(Str(side _client)), getPlayerUID(_client)];

_return_id = "extDB2" callExtension _query;
_return_id = (call compile _return_id) select 1;
_pipe = "No-Return";
_queryResult = "";

while { _pipe != "" } do {
  _pipe = "extDB2" callExtension format["5:%1", _return_id];
  if ( _pipe != "[3]" ) then {
    _queryResult = _queryResult + _pipe;
  };
};

return ((call compile _queryResult) select 1)




