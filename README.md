# ldapauditing
-------------------------------------------------------------------------------

Disclaimer

The sample scripts are not supported under any Microsoft standard support 

program or service. 

The sample scripts are provided AS IS without warranty of any kind. Microsoft

further disclaims all implied warranties including, without limitation, any 

implied warranties of merchantability or of fitness for a particular purpose.

The entire risk arising out of the use or performance of the sample scripts and 

documentation remains with you. In no event shall Microsoft, its authors, or 

anyone else involved in the creation, production, or delivery of the scripts be

liable for any damages whatsoever (including, without limitation, damages for 

loss of business profits, business interruption, loss of business information, 

or other pecuniary loss) arising out of the use of or inability to use the 

sample scripts or documentation, even if Microsoft has been advised of the 

possibility of such damages.

-----------------------------------------------------------------------------#>
sample scripts to collect events about insecure ldap usage

This is quick and dirty code to enable, disable auditing and get events around insecure LDAP usage as explained in: 
https://portal.msrc.microsoft.com/en-us/security-guidance/advisory/ADV190023

Usage

first get parallelexecution module with "install-module parallelexecution"
https://github.com/fernandorubioroman/parallelexecution

Then clone this repository into C: (or change code to reflect the foldder where you leave the scripts)
Run enableeventcapture to enable auditing WARNING: This can be very noisy (one event per insecure auth) leave it only for a few minutes. By default it will work on DCs in the default-first-site. Change in code if you want a different site or all of them (Line 7 of script)

After a few minutes,  run disableeventcapture to stop the verbose event collection. Same considerations as enabling applies

Then run getldapinterfaceevents to retrieve the generated 2889 events, they will be exported to ldapevents.xml in the ldapauditing folder

Lastly import that xml into a powershell session using $events=import-clixml - path ldapevents.xml and parse it.  Alternatively the following script can be used to get and parse the events for one machine

https://github.com/russelltomkins/Active-Directory/blob/master/Query-InsecureLDAPBinds.ps1





