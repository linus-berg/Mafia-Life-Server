private["_spawns", "_spawnName ", "_spawnPoint", "_Added_Spawn"];
_spawns = _this;
ML_Server_Spawns = [];

_spawnPoint = "";

{
	_spawnName = (_x select 0);
	_spawnPoint = format["ML_Spawn_%1", (_x select 1)];
	{	
		switch _x do{
			case "CIV": {
				_Added_Spawn = [civilian, _spawnPoint, _spawnName] call BIS_fnc_addRespawnPosition;
			};
			case "WEST": {
				_Added_Spawn = [west, _spawnPoint, _spawnName] call BIS_fnc_addRespawnPosition;
			};
			case "EAST": {
				_Added_Spawn = [independent, _spawnPoint, _spawnName] call BIS_fnc_addRespawnPosition;
			};
		};
		ML_Server_Spawns pushBack _Added_Spawn;
	}forEach ([(_x select 2), ","] call BIS_fnc_splitString);
}forEach _spawns;

[]