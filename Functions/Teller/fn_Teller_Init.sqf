#include "\ML_Functions\ML_Macros.h"

private["_tellers", "_teller_list"];
_tellers = _this;

if ( isNil "ml_teller_markers" ) then {
  ml_teller_markers = [];
} else {
  {
    deleteMarker _x;
  } count ml_teller_markers;
};
{
  _teller_npc = M_NAMESPACE("ML_Teller_" + (_x select 1), objNull);
  _x set [1, netId _teller_npc];
  _teller_npc setVariable ["ml_teller_id", _x select 0, true];
  ml_teller_markers pushBack
      ([["ML_Teller_Marker_", _teller_npc], _x select 2, _x select 4] call
          ML_Server_fnc_Marker_Create);
} forEach _tellers;
ML_Server setVariable ["ML_Tellers", _tellers, true];

return true