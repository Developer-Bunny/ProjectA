#Primero con bucle Do/While
Write-host "-----";
$token = 0;
Do {
    Write-Host $token;
    $token = $token + 3;
} While ($token -lt 100);

#Segundo Programa bucle Do/Until
Write-host "-----";
$token = 0;
Do {
    Write-Host $token;
    $token = $token + 3;
} Until ($token -ge 100);

#Tercer programa bucle for
Write-host "-----";
For ($token = 0;$token -lt 100;$token = $token + 3) {
Write-Host $token;
}