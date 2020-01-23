$sitename="Default-First-Site-Name"
$domains=(Get-ADForest).domains
$dcs=@()
foreach ($domain in $domains){
$dcs+=get-addomaincontroller -filter * -server $domain
}
$dcsinsite=$dcs |where site -eq $sitename
$enablecollection=$dcsinsite | select -ExpandProperty hostname| Start-ParallelExecution -script "EnableLDAPInterfaceEvents.ps1" -ScriptFolder C:\ldapauditing -Verbose
$enablecollection.Values.results