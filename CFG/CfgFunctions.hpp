class cfgFunctions {
	version = 3.0;
	createShortcuts = 1;
	
	class ML_Server{
		tag = ML_Server;
		//---Initialization---//
		class Server_Initialization{
			file = "ML_Server\Functions\Initialization";
			class Initialization{
				description = "Initializes server functions.";
				postInit = 1;
			};
			class Init_Side{};
			class Init_Spawns{};
		};
		//---
		
		//---Vendor---//
		class Server_Vendor{
			file = "ML_Server\Functions\Vendor";
			class Vendor_Setup{
				description = "Loads all Vendors.";
			};
			class Vendor_GetSpawn{
				description = "Gets spawn points.";
			};
		};
		//---
		
		//---Permits---//
		class Server_Permit{
			file = "ML_Server\Functions\Permits";
			class Permit_Setup{
				description = "Loads all permits.";
			};
		};
		//---

		//---Permits---//
		class Server_Teller{
			file = "ML_Server\Functions\Teller";
			class Teller_Init{
				description = "Loads all Tellers.";
			};
		};
		//---

		//---Client/Data---//
		class Server_Data{
			file = "ML_Server\Functions\Data";
			class Data_Init{};
			class Data_Set{};
			class Data_Register{};
			class Data_Load{};
			class Data_Sync{};
		};
		//---
		
		//---Network---//
		class Server_Network{
			file = "ML_Server\Functions\Network";
			class Network_ServerSetup{
				description = "Loads network things.";
			};
			class Network_ServerToClient{
				description = "Returns stuff";
			};
			class Network_Notify {};
			class HandleDisconnect{};
		};
		//---
		
		//---Markers---//
		class Server_Markers{
			file = "ML_Server\Functions\Marker";
			class Marker_Create{
				description = "Create global marker.";
			};
		};
		//---
		
		//---Quests---//
		class Server_Quest{
			file = "ML_Server\Functions\Quests";
			class Quests_Setup{
				description = "Loads all quests.";
			};
		};
		//---
		
		//---Family---//
		class Server_Family{
			file = "ML_Server\Functions\Family";
			class Family_Set{};
			class Family_Setup{};
		};
		//---
		
		//---SQL---//
		class Server_SQL{
			file = "ML_Server\Functions\SQL";
			class SQL_Setup{};
			class SQL_Vendor{
				description = "Queries the SQL database to return all Vendors.";
			};
			class SQL_GetMarker{
				description = "Queries the SQL database to return a specific marker.";
			};
			class SQL_Teller{
				description = "Queries the SQL database to return all Tellers.";
			};
			class SQL_GetItems{
				description = "Queries the SQL database to return all items for given Vendor.";
			};
			class SQL_Permits{
				description = "Queries the SQL database to return all permits.";
			};
			class SQL_Quests{
				description = "Queries the SQL database to return all quests.";
			};
			class SQL_Spawns{
				description = "Queries the SQL database to return all spawn points.";
			};
			class SQL_Client_Retrieve{};
			class SQL_Client_Insert{};
			class SQL_Client_Account{};
			class SQL_Client_Register{};
			class SQL_Client_Update{};
			class SQL_Family{};
			class SQL_Family_UpdateBoss{};
			class SQL_Family_UpdateMembers{};
			class SQL_Mail_Send{};
			class SQL_Mail_Retrieve{};
			class SQL_Mail_Update {};
		};
		//---
	};
};