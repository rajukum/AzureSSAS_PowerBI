# AzureSSAS_PowerBI
To Query Azure Analysis services from On-Prem using Application ID and secrete. 
Remember to use the most recent dlls for the references, when i ran / created this script i had the following version. 

GAC    Version        Location                                                                                                                                                                 
---    -------        --------                                                                                                                                                                 
True   v4.0.30319     C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\Microsoft.AnalysisServices.Tabular\v4.0_15.0.0.0__89845dcd8080cc91\Microsoft.AnalysisServices.Tabular.dll                     
True   v4.0.30319     C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\Microsoft.AnalysisServices.Core\v4.0_15.0.0.0__89845dcd8080cc91\Microsoft.AnalysisServices.Core.dll                           
False  v4.0.30319     C:\Program Files\WindowsPowerShell\Modules\ADAL.PS\3.19.8.1\Microsoft.IdentityModel.Clients.ActiveDirectory.3.19.8\Microsoft.IdentityModel.Clients.ActiveDirectory.dll  

You also have to replace TenantID, CleintID, AppkEy and Azure AS ServerName from the script. 

To run, open a PowerShell window and run the script. 
