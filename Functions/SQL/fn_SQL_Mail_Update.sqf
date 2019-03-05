#include "\ML_Functions\ML_Macros.h"
params[
  ["_read", [], [[]]],
  ["_items", [], [[]]]
];
private["_query"];
{
  if ((_x select 0) in _read) then {
    _read = _read - [(_x select 0)];
    _query = format["1:QUERY_QUOTES:UPDATE mail SET Items = '%1', Coins = '%2', `Read` = 'Y' WHERE ID = %3", (_x select 1), (_x select 2), (_x select 0)];
  } else {
    _query = format["1:QUERY_QUOTES:UPDATE mail SET Items = '%1', Coins = '%2' WHERE ID = %3", (_x select 1), (_x select 2), (_x select 0)];
  };
  "extDB2" callExtension _query;
} forEach _items;
{
  _query = format["1:QUERY_QUOTES:UPDATE mail SET `Read` = 'Y' WHERE ID = %1", _x];
  "extDB2" callExtension _query;
} forEach _read;



