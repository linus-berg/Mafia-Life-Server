#include "\ML_Functions\ML_Macros.h"

private ["_fID", "_fMembers"];

_fID = ([_this, 0, 0, [0]] call BIS_fnc_param);
_fMembers = ([_this, 1, [], [[]]] call BIS_fnc_param);

_query = "1" + format[GET_QUERY, _fID, _fMembers];

("extDB2" callExtension _query)





