private["_cfg"];
_cfg = (missionconfigfile >> "CfgRespawnInventory");

{
	switch (getText(_cfg >> _x >> "Side")) do{
		case "Police":{
			[west, _x] call BIS_fnc_addRespawnInventory;
		};
		case "Civ":{
			[civilian, _x] call BIS_fnc_addRespawnInventory;
		};
		case "Ins":{
			[independent, _x] call BIS_fnc_addRespawnInventory;
		};
		default{
			[missionNamespace, _x] call BIS_fnc_addRespawnInventory;
		};
	};
	
}count (_cfg call BIS_fnc_getCfgSubClasses);
