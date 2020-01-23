$sitename="Default-First-Site-Name"
$domains=(Get-ADForest).domains
$dcs=@()
foreach ($domain in $domains){
$dcs+=get-addomaincontroller -filter * -server $domain
}
$dcsinsite=$dcs |where site -eq $sitename
$ldapevents=$dcsinsite | select -ExpandProperty hostname| Start-ParallelExecution -script "getldapevents.ps1" -ScriptFolder C:\findhardcodedDCs  -Verbose
$ldapevents.Values 