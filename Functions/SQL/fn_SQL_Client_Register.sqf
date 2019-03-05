#include "\ML_Functions\ML_Macros.h"

private ["_client", "_email", "_hash", "_salt", "_query", "_password"];

_client = objectFromNetId([_this, 0, "", [""]] call BIS_fnc_param);
_email = ([_this, 1, "", [""]] call BIS_fnc_param);
_hash = ([_this, 2, "", [""]] call BIS_fnc_param);
_salt = ([_this, 3, "", [""]] call BIS_fnc_param);

_query = "1" + format[GET_QUERY, getPlayerUID(_client), _email, _hash, _salt];

("extDB2" callExtension _query)





