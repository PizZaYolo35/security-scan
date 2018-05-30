<# �tablir un scan de s�rurit� comprenant les �l�mnets suivants: 
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

echo "votre note de s�curit� est: $note"


        if ($note -eq 10 -or $note -eq 9) {
        echo "votre syst�me est tr�s s�curis�"
        } 

        elseif ($nb -eq 8 -or $nb -eq 7) {
        echo "votre syst�me est s�curis�"
        }

        elseif ($nb -eq 6 -or $nb -eq 5) {
        echo "votre syst�me a des failles"
        }

        else {
        echo "vous devez revoir la s�curit� de votre syst�me"
        }
