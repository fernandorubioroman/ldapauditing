$events=Get-WinEvent -FilterHashtable @{LogName="Directory Service" ; ID=2889 } 
$events | select userID -Unique
