#include "\ML_Functions\ML_Macros.h"

private["_npc_info", "_marker_text", "_marker_info", "_marker"];
_npc_info = [_this, 0, [], [[]]] call BIS_fnc_param;
_marker_text = [_this, 1, "", [""]] call BIS_fnc_param;
_marker_info = 
    ([_this, 2, 1, [0]] call BIS_fnc_param) call ML_Server_fnc_SQL_GetMarker;

_marker = createMarker [format["%2%1", _npc_info select 0, _npc_info select 1],
                        GetPosATL (_npc_info select 1)];

_marker setMarkerShape "ICON";
_marker setMarkerText _marker_text;
_marker setMarkerType (_marker_info select 0);
_marker setMarkerColor (_marker_info select 1);
_marker setMarkerSize [0.7, 0.7];

return _marker