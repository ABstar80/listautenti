$server="nomedelserver"
$computer = [ADSI]"WinNT://$server,computer"

$computer.psbase.children | where { 

$_.psbase.schemaClassName -eq 'group' } | foreach {
    write-host $_.name
    write-host "------"
    $group =[ADSI]$_.psbase.Path
    $group.psbase.Invoke("Members") | foreach {
$_.GetType().InvokeMember("Name", 'GetProperty', 

$null, $_, $null)}
    write-host
}