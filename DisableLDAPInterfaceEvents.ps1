$childkey= 'HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\diagnostics\'
Set-ItemProperty -Path $childkey -Name "16 LDAP Interface Events" -Value 0
Get-ItemProperty -Path $childkey -Name "16 LDAP Interface Events"