#include "\ML_Functions\ML_Macros.h"

private ["_client", "_fID", "_rank", "_family", "_family_boss", "_family_members", "_family_group"];

_client = objectFromNetId([_this, 0, "", [""]] call BIS_fnc_param);
_fID = (_this select 1) select 0;
_rank = (_this select 1) select 1;
if(([_client] call ML_fnc_Client_Side) != civilian) exitWith {};

_family = _fID call ML_fnc_Family_GetInfo;
_family_boss = (_family select 2);
_family_members = (_family select 3);
_family_group = (_family select (count _family)-1);

if(typeName _family_group == "STRING") then {
	[_client] join groupFromNetID(_family_group);
	
	if((_family_boss select 1) == (getPlayerUID _client) || _rank > ML_RANK(leader group _client)) then{
		(group _client) selectLeader _client;
    /* setGroupOwner possible new command? */
		{
			["ML_Network_Client_Family_Leader", [netId(group _client), netId(_client)], netId(_x)] call ML_Server_fnc_Network_ServerToClient;
		}count (units (group _client));
	};
} else {
	[_client] join (createGroup civilian);
	_family_group = group _client;
	_family set [(count _family)-1, netID(_family_group)];
	
	ML_Family setVariable [str(_fID), _family, true];
	_family_group setVariable["ID",(_family select 0), true];
};

//If player name has changed since last SQL update.
if((_family_members find [name _client, getPlayerUID _client]) == -1)then{
	if((_family_boss select 1) == (getPlayerUID _client))then{
		if((_family_boss select 0) != name _client)then{
			_family_boss set [0, name _client];
			_family set [2, _family_boss];
			ML_Family setVariable [str(_fID), _family, true];
			[_fID, _family_boss] call ML_Server_fnc_SQL_Family_UpdateBoss;
		};
	}else{
		{
			if((_x select 1) == getPlayerUID _client)exitWith{
				_x set [0, name _client];
			};
		}forEach _family_members;
		_family set [3, _family_members];
		ML_Family setVariable [str(_fID), _family, true];
		[_fID, _family_members] call ML_Server_fnc_SQL_Family_UpdateMembers;
	};
};