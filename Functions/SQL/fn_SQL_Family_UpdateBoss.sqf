#include "\ML_Functions\ML_Macros.h"

private ["_fID", "_fMembers"];

_fID = ([_this, 0, 0, [0]] call BIS_fnc_param);
_fBoss = ([_this, 1, [], [[]]] call BIS_fnc_param);

_query = "1" + format[GET_QUERY, _fID, _fBoss];

("extDB2" callExtension _query)





