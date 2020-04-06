**-Bunny-Developer-**
$entry = Read-Host "Escribe lo que quieras";
#Indicaciones de divisores
$pattern2 = '[02468]$';
$pattern3 = 3,6,9,12,15,18,21,24,29,30;
$pattern4 = 4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96;
$pattern5 = '[05]$';
$pattern7 = 7,14,21,28,35,42,49,56,63,70,77,84,91,98;
$pattern10 = '[0]$';
$pattern11 = 11,22,33,44,55,66,77,88,99;
$largoentrada = $entry.Length;

#gracioso
$entry = [int]$entry;
if ($entry -eq 0) {
    Write-Host "¿En serio?";
    exit;
}
$entry = $entry.ToString();

#divisor de uno
Write-Host "1 y"$entry;

#divisor de dos
if ($entry -match $pattern2){
    $div = $entry / 2;
    Write-Host  "2 y"$div;
    $dos = 1;
} else {
    $dos = 0;
}

#divisor de tres
$suma = 0;
$sumar = 0;
for($token = 0;$token -lt $largoentrada;$token++){
    
    $t = $entry.Substring($token,1);
    $t = [int]$t;
    $suma = $suma + $t;
    #Write-Host $t;
    #Write-Host "suma"$suma;
    #Write-Host "token suma"$token;
}
$suma = $suma.ToString()
if ($suma -gt 30){
    for($token = 0;$token -lt $suma.Length;$token++){
        $t = $suma.Substring($token,1);
        $t = [int]$t;
        $sumar = $sumar + $t;

        #Write-Host $t;
        #Write-Host "sumar" $sumar;
        #Write-Host "token sumar"$token;
    }
}
if (($pattern3 -contains $suma) -or ($pattern3 -contains $sumar)) {
    $div = $entry / 3;
    Write-Host "3 y"$div;
    $tres = 1;
} else {
    $tres = 0;
}

#divisor de 4
if ($largoentrada -ge 2) {
    $t = $entry.Substring(($largoentrada - 2),2);
    $suma = [int]$t;
    if (($pattern4 -contains $suma) -or ($suma -eq 0)) {
        $div = $entry / 4;
        Write-Host "4 y"$div;
    }
} else {
    if ($pattern4 -contains $entry) {
        $div = $entry / 4;
        Write-Host "4 y"$div;
    }
}

#divisor de 5
if ($entry -match $pattern5){
    $div = $entry / 5;
    Write-Host  "5 y"$div;
}

#divisor de seis
if (($dos -eq 1) -and ($tres -eq 1)) {
    $div = $entry / 6;
    Write-Host  "6 y"$div;
}

#divisor de siete
if ($entry.Length -ge 3) {
    $token = 0;
    $primero = $entry.Substring(0,($largoentrada - 1));
    $segundo = $entry.Substring(($largoentrada -1),1);
    #Write-Host $primero "y"$segundo;
    do{
        $segundo = [int]$segundo;
        $primero = [int]$primero;
        $resultado = $primero - ($segundo*2);
        #Write-Host $resultado;
        if ($resultado -le 100){
            $token = 1;
            if($pattern7 -contains $resultado){
                $div = $entry / 7;
                Write-Host "7 y"$div;
            }
        } else {
            $resultado = $resultado.ToString();
            $primero = $resultado.Substring(0,($resultado.Length - 1));
            $segundo = $resultado.Substring(($resultado.Length -1),1);
        }
    } Until ($token -eq 1)
} else {
    if($pattern7 -contains $entry){
                $div = $entry / 7;
                Write-Host "7 y"$div;
            }
}

#divisor de nueve
if ($tres -eq 1) {
    $div = $entry / 9;
    Write-Host  "9 y"$div;
}

#divisor de diez
if ($entry -match $pattern10){
    $div = $entry / 10;
    Write-Host  "10 y"$div;
}

#divisor de once
$conteo = 0;
$once = 0;
for($token = ($largoentrada - 1);$token -ge 0;$token--){
    $conteo++;
    $t = $entry.Substring($token,1);
    $t = [int]$t;
    if ($conteo -eq 1) {
        $once = $once + $t;
    }
    if ($conteo -eq 2) {
        $once = $once - $t;
        $conteo = 0;
    }
    #Write-Host $t;
    #Write-Host "once" $once;
    #Write-Host "token 11"$token;
}
if(($pattern11 -contains $once) -or ($once -eq 0)){
    $div = $entry / 11;
    Write-Host "11 y"$div;
}