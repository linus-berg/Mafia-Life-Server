#include "\ML_Functions\ML_Macros.h"

private["_query", "_return_id", "_pipe", "_queryResult"];
params[
  ['_recipients', [], [[]]],
  ['_sender', "", [""]],
  ['_subject', "", [""]],
  ['_message', "", [""]],
  ['_items', [], [[]]],
  ['_coins', 0, [0]],
  ['_COD', "N", [""]]
];

_query = "1:QUERY_QUOTES:
INSERT INTO mail 
  (UID,
   Sender,
   Subject,
   Message,
   Items,
   Coins,
   COD)
VALUES
";

{
  _query = _query + format["('%1', '%2', '""%3""', '""%4""', '%5', %6, '%7')", _x, _sender, _subject, 
                           _message, _items, _coins, _COD];
  if (_forEachIndex == (count _recipients)-1) then {
    _query = _query + ";";
  } else {
    _query = _query + ",";
  };
} forEach _recipients;

return ("extDB2" callExtension _query);
