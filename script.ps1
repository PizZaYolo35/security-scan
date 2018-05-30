<# établir un scan de sérurité comprenant les élémnets suivants: 
-scan de l'antivirus
-scan du firewall
-windows update actif
#>

[int]$note = 10
$tab= @("wuauserv", "MpsSvc", "WinDefend")
$services = Get-Service -name $tab | select status
$ports = ":80|:3389|:443|:8080|:445"


if ($services -eq "Running") {
         }
else {$note--}

$stats = netstat -nao | Select-String "ESTABLISHED" | Select-String -notmatch ($ports) 
foreach($line in $stats) {
    $note--
}

echo "votre note de sécurité est: $note"


        if ($note -eq 10 -or $note -eq 9) {
        echo "votre système est très sécurisé"
        } 

        elseif ($nb -eq 8 -or $nb -eq 7) {
        echo "votre système est sécurisé"
        }

        elseif ($nb -eq 6 -or $nb -eq 5) {
        echo "votre système a des failles"
        }

        else {
        echo "vous devez revoir la sécurité de votre système"
        }
