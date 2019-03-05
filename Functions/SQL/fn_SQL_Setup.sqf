_sqlFunctions = (configFile >> "CfgFunctions" >> "ML_Server" >> "Server_SQL") call Bis_fnc_getCfgSubClasses;
{
  _file = loadFile (format["\ML_Server\Functions\SQL\Queries\%1.sql", _x]);
  if (_file != "") then {
    missionNamespace setVariable [format["%1_queryFile", _x], format[":QUERY_QUOTES:%1", _file]];
  }
} forEach _sqlFunctions;

diag_log format["%1", _fnc_scriptName];