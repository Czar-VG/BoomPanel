void PlayersIP_OnClientIDRecived(int client)
{
	
	char ClientIP[20], query[255];
	GetClientIP(client, ClientIP, sizeof(ClientIP));
	
	Format(query, sizeof(query), "INSERT INTO bp_players_ip (pid, ip) VALUES (%i, '%s') ON DUPLICATE KEY UPDATE connections = connections + 1", iClientID[client], ClientIP);
	
	DB.Query(OnRowInserted, query, _, DBPrio_Low);
	
}