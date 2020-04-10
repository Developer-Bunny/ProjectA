$cont = ((Select-String -Path ".\Opciones" -Pattern "list") -split "=")[1]
$cont = Read-Host "Cantidad que se lista $cont"
$split = ((Select-String -Path ".\Opciones" -Pattern "split") -split "=")[1]
$split = Read-Host "Metodo division $split"
$url = ((Select-String -Path ".\Opciones" -Pattern "url") -split "=")[1]
Write-Host "URl actual $url"
$url = Read-Host "Escriba la direccion del fichero ej: C:\users..."


$cont = "long_List=$cont" | Out-File -FilePath ".\Opciones" 
$split = "split=$split" | Out-file -FilePath ".\Opciones" -Append 
$url = "url=$url" | Out-file -FilePath ".\Opciones" -Append 

$conf = Get-Content -Path ".\Opciones"
Write-Host $conf
pause