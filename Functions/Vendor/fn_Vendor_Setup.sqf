#include "\ML_Functions\ML_Macros.h"

private ["_Vendors","_i","_Vendor", "_Vendor_ID", "_Vendor_npc", "_ML_Vendor_List"];

_vendors = _this;
_ml_vendor_list = [];

if ( isNil "ML_Vendor_Markers" ) then {
  ml_vendor_markers = [];
} else {
  {
    deleteMarker _x;
  } count ML_Vendor_Markers;
};

for "_i" from 0 to (count _vendors)-1 do {
  _vendor = (_vendors select _i);
  _vendor_id = (_vendor select 1);
  _vendor_npc   = missionNamespace getVariable [ML_VENDOR(_vendor_id), ObjNull];
  if ( isNull _Vendor_npc ) then {
    ML_LOG("ERROR: Shop does not exist number: " + Str(_i));
  } else {
    _vendor_npc setVariable ["ML_Vendor_Name", (_vendor select 0), true];
    _vendor_npc setVariable ["ML_Vendor_Side", (_vendor select 2), true];
    _vendor_npc setVariable ["ML_Vendor_Items", (_vendor_id call ML_Server_fnc_SQL_GetItems), true];
    _vendor_npc setVariable ["ML_Vendor_Box", ([0, (_Vendor select 3)] call ML_Server_fnc_Vendor_GetSpawn), true];
    _vendor_npc setVariable ["ML_Vendor_Vehicle", ([1, (_Vendor select 4)] call ML_Server_fnc_Vendor_GetSpawn), true];
    ML_Vendor_Markers pushBack 
        ([["ML_Vendor_Marker_", _vendor_npc], _Vendor select 0,
          _vendor select 5] call ML_Server_fnc_Marker_Create);
    _ML_Vendor_List pushBack (netId _Vendor_npc);
  };
};

ML_Server setVariable ["ML_Vendor_List", _ML_Vendor_List, true];
true