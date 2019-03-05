#include "\ML_Functions\ML_Macros.h"

private["_client", "_query", "_return_id", "_pipe", "_queryResult"];
_client = objectFromNetId([_this, 0, "", [""]] call BIS_fnc_param);

_query = "2" + format[GET_QUERY, getPlayerUID(_client)];

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




