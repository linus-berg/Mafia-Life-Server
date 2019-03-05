"ML_Network_Server" addPublicVariableEventHandler {
  diag_log format["Public vars?: %1", _this];
	(_this select 1) call ML_fnc_Network_Handle
};

[
	"ML_Network_Server_Data_Init",
	{
    diag_log _this;
		_this call ML_Server_fnc_Data_Init;
	}
] call ML_fnc_Network_AddEvent;

[
	"ML_Network_Server_Data_Register",
	{
		_this call ML_Server_fnc_Data_Register;
	}
] call ML_fnc_Network_AddEvent;

[
	"ML_Network_Server_Data_Sync",
	{
    diag_Log format["Dsync called? %1", _this];
		_this call ML_Server_fnc_Data_Sync;
	}
] call ML_fnc_Network_AddEvent;

[
	"ML_Network_Server_Data_Family_SyncMembers",
	{
		_this call ML_Server_fnc_SQL_Family_UpdateMembers;
	}
] call ML_fnc_Network_AddEvent;

[
	"ML_Network_Server_Data_Family_JoinGroup",
	{
		_this call ML_Server_fnc_Family_Set;
	}
] call ML_fnc_Network_AddEvent;

[
  "ML_Network_Server_Data_SendMail",
  {
    diag_log _this;
    _this call ML_Server_fnc_SQL_Mail_Send;
  }
] call ML_fnc_Network_AddEvent;

[
  "ML_Network_Server_Data_OpenMail",
  {
    ["ML_Network_Client_Mail_Open", _this call ML_Server_fnc_SQL_Mail_Retrieve, _this] call ML_Server_fnc_Network_ServerToClient;
  }
] call ML_fnc_Network_AddEvent;

[
  "ML_Network_Server_Data_UpdateMail",
  {
    _this call ML_Server_fnc_SQL_Mail_Update;
  }
] call ML_fnc_Network_AddEvent;


[
  "ML_Network_Server_Client_Exists",
  {
    (objectFromNetID(_this)) call ML_Server_fnc_SQL_Client_Account;
  }
] call ML_fnc_Network_AddEvent;