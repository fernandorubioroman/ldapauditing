$sitename="Default-First-Site-Name"
$domains=(Get-ADForest).domains
$dcs=@()
foreach ($domain in $domains){
$dcs+=get-addomaincontroller -filter * -server $domain
}
$dcsinsite=$dcs |where site -eq $sitename
$disablecollection=$dcsinsite | select -ExpandProperty hostname| Start-ParallelExecution -script "DisableLDAPInterfaceEvents.ps1" -ScriptFolder C:\findhardcodedDCs -Verbose
$disablecollection.Values.results | select '16 LDAP Interface Events',PSComputerName