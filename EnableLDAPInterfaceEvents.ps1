$key = 'HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\'
$subkeys=Get-childItem -Path $key
if ($subkeys.name -notcontains "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NTDS\Diagnostics"){
New-Item -Path $key -Name "Diagnostics" -ItemType key
}
$childkey= 'HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\diagnostics\'
$properties=Get-Item -Path $childkey 
if ($properties.Property -notcontains "16 LDAP Interface Events"){
New-ItemProperty -Path $childkey -Name "16 LDAP Interface Events" -Value 2
}
else{
Set-ItemProperty -Path $childkey -Name "16 LDAP Interface Events" -Value 2
}
Get-ItemProperty -Path $childkey -Name "16 LDAP Interface Events"