# This code will get all storage accounts and display details
foreach($store in Get-AzurestorageAccount)
{
	Write-Host $store.StorageAccountName: $Store.StatusOfPrimary -ForeGroundColor  Yellow
}

# This code will get all web sites and display details
foreach($website in Get-AzureWebsite)
{
	Write-Host $website.HostNames: $website.Name -ForegroundColor  Gray
}


foreach($sql in Get-AzureSqlDatabaseServer)
{
	Write-Host $sql.ServerName
	foreach($db in Get-AzureSqlDatabase -Servername $sql.ServerName)
	{
		write-Host "  " $db.Name : $db.SizeMB -ForegroundColor Yellow


		
	}
}