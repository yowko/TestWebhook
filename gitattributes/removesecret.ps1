Param([string]$filePath)
[xml]$Config = Get-Content -Path $filePath
$Config.configuration.connectionStrings.add| foreach {$_.connectionString=$_.connectionString -replace '(data source|user id|password)=(.*?);','$1= - ;'}
$Config.Save($filePath)