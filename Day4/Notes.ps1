$storageAccountName = "adatumstoragegirish"
$shareName ="assets"
$folderName ="Invoices"

$StorageAccountKey= (Get-AzureStorageKey -StorageAccountName $storageAccountName).Primary

$ctx = New-AzureStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $StorageAccountKey

$s=New-AzureStorageShare -Name $shareName -Context $ctx

New-AzureStorageDirectory -Share $s -Path $folderName

$thisFolder = Split-Path -Parent $MyInvocation.MyCommand.Definition

$sourceFolder = "$thisFolder\$folderName"

$files=Get-ChildItem $sourceFolder
foreach($file in $files)
{
    $fileName = "$sourceFolder\$file"
    Set-AzureStorageFileContent -Share $s -Source $fileName -Path $folderName
} 
