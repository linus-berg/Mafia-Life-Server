#include "\ML_Functions\ML_Macros.h"

private ["_quests", "_ML_Quest_NPC_List", "_i", "_quest", "_quest_npc", "_quest_information", "_npc_quests"];

_quests = _this;
_ML_Quest_NPC_List = [];

for "_i" from 0 to (count _quests)-1 do
{
	_quest = (_quests select _i);
	_quest_npc = missionNamespace getVariable (_quest select 1);
	if(isNull _quest_npc)then{
		ML_LOG("ERROR: Quest NPC does not exist number: " + Str(_i));
	} else {
		_quest_information = [];
		_npc_quests = [];
		_quest_information pushBack (_quest select 0); //ID 0
    _quest_information pushBack netId (missionNamespace getVariable [(_quest select 2), objNull]); //NPC End 1
		_quest_information pushBack (_quest select 3); //Quest Name 2
		_quest_information pushBack (_quest select 4); //Information 3
    _quest_information pushBack (_quest select 5); //Coin reward 4
		_quest_information pushBack (_quest select 6); //Rewards 5
		_quest_information pushBack (_quest select 7); //Requirements 6
		_quest_information pushBack (_quest select 8); //Box 7
		_quest_information pushBack (_quest select 9); //Vehicle 8
    _quest_information pushBack (_quest select 10); //Next Quest 9
    _quest_information pushBack (_quest select 11); //Previous Quest 10
		_quest_npc setVariable [format["Quest_%1", (_quest select 0)], _quest_information, true];
		_npc_quests = (_quest_npc getVariable ["Quests", []]);
		_npc_quests pushBack (_quest select 0);
		_quest_npc setVariable ["Quests", _npc_quests, true];
		if(!((netId _quest_npc) in _ML_Quest_NPC_List))then{
			_ML_Quest_NPC_List pushBack (netId _quest_npc);
		};
	};
};

ML_Server setVariable ["ML_Quest_NPC_List", _ML_Quest_NPC_List, true];
true