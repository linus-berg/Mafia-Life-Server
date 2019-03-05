#include "\ML_Functions\ML_Macros.h"

ML_ServerInitialized = False;
publicVariable "ML_ServerInitialized";

"extDB2" callExtension "9:ADD_DATABASE:Database";
"extDB2" callExtension "9:ADD_DATABASE_PROTOCOL:Database:SQL_RAW_v2:QUERY";
"extDB2" callExtension "9:ADD_DATABASE_PROTOCOL:Database:SQL_RAW_v2:QUERY_QUOTES:ADD_QUOTES";
ML_LOG("ExtDB output size: " + "extDB2" callExtension "9:OUTPUTSIZE") /* Log the output size for debugging. */
"extDB2" callExtension "9:LOCK"; /* Make sure it stays this way and can not be modified. */
ML_LOG("ExtDB connected.")

call ML_Server_fnc_SQL_Setup;
call ML_Server_fnc_Network_ServerSetup;
ML_LOG("Networking setup completed.")

(call ML_Server_fnc_SQL_Teller) call ML_Server_fnc_Teller_Init;

(call ML_Server_fnc_SQL_Vendor) call ML_Server_fnc_Vendor_Setup; 
ML_LOG("Vendors setup completed.")

(call ML_Server_fnc_SQL_Permits) call ML_Server_fnc_Permit_Setup; 
ML_LOG("Permits setup completed.")

(call ML_Server_fnc_SQL_Quests) call ML_Server_fnc_Quests_Setup; 
ML_LOG("Quests setup completed.")

(call ML_Server_fnc_SQL_Spawns) call ML_Server_fnc_Init_Spawns; 
ML_LOG("Spawns setup completed.")

(call ML_Server_fnc_SQL_Family) call ML_Server_fnc_Family_Setup;
 ML_LOG("Family setup completed.")

call ML_Server_fnc_Init_Side;

addMissionEventHandler ["HandleDisconnect", 
                        "[(_this select 0), (_this select 2),
                          (_this select 3)] call ML_Server_fnc_HandleDisconnect"];

ML_ServerInitialized = True;
publicVariable "ML_ServerInitialized";
true