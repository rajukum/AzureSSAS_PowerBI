[Reflection.Assembly]::LoadWithPartialName("Microsoft.AnalysisServices.Tabular")
[Reflection.Assembly]::LoadWithPartialName("Microsoft.AnalysisServices.Core")
[Reflection.Assembly]::LoadWithPartialName("Microsoft.IdentityModel.Clients.ActiveDirectory")

$resourceURI = "https://*.asazure.windows.net"
$authority = "https://login.windows.net/ReaplaceWithTenantName/oauth2/authorize"
$ac = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList ($authority)
$clientId = "ReplaceWithAzureADApplicationName"
$appKey="ReplaceWithSecreteofApplicationName"
$cred = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.ClientCredential" -ArgumentList ($clientId,$appKey)
$authResult = $ac.AcquireTokenAsync($resourceURI,$cred)
 
 while (-not $authResult.AsyncWaitHandle.WaitOne(200)) { }
 $accessToken=$authResult.GetAwaiter().GetResult().AccessToken

$SSASServer = New-Object Microsoft.AnalysisServices.Tabular.Server
$connstring = "Persist Security Info=True; Impersonation Level=Impersonate;Data Source=ReplaceWithasazureServerName;User ID=;Password=" + $accessToken
$SSASServer.Connect($connstring);
$SSASServer.Databases | Select Name, Collation, CompatibilityLevel, CreatedTimeStamp, EstimatedSize, LastProcessed | FT -wrap | Out-String

