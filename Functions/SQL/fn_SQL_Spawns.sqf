#include "\ML_Functions\ML_Macros.h"

private["_query", "_return_id", "_pipe", "_queryResult"];
_query = "2" + GET_QUERY;

_return_id = "extDB2" callExtension _query;
_return_id = (call compile _return_id) select 1;
_pipe = "No-Return";
_queryResult = "";

while{_pipe != ""} do {
	_pipe = "extDB2" callExtension format["5:%1", _return_id];
	if(_pipe != "[3]") then {
		_queryResult = _queryResult + _pipe;
	};
};
diag_log _queryResult;
((call compile (_queryResult)) select 1)




