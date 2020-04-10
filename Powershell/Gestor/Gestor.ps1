$entry = ""
$criva = ""
        

while ($entry -ne "Salir"){
    $long_List = ((Select-String -Path ".\Opciones" -Pattern "list") -split "=")[1]
    $split = ((Select-String -Path ".\Opciones" -Pattern "split") -split "=")[1]
    $url = ((Select-String -Path ".\Opciones" -Pattern "url") -split "=")[1]
    Clear-Host;
    Write-Host "1- Listar archivo";
    Write-Host "2- Escrivir archivo";
    Write-Host "3- Cribado documento";
    Write-Host "4- Listado y busqueda";
    Write-Host "   [Salir]"

    $entry = Read-Host "Indique una opcion";

    if ($entry -eq "conf") {
        Start-Process -FilePath "powershell.exe" -ArgumentList ".\Conf.ps1"
        Write-Host "estas en configuracion"
        pause;
    }

    switch ($entry){
        1 {
            $a = Get-Content -Path $url
            Write-Host $a;
            pause;
            break;
          }
        2 {
            do{
            $entry = Read-Host "Guardado o [S]alir"
            $entry = $entry +$split;
            $entry | Out-File -FilePath $url -Append -NoNewline;
            if ((Get-Content -Path $url) -contains $entry) {
                Write-Host "Bien"
            }
            pause;
            break;
            } Until ($entry -contains "s")
          }
        3 {
            Write-Host "cribado de documento"
            $warn = Read-Host "quiere continuar? s/n"
            if ($warn -eq "s") {
            $criva = Get-Content -Path $url
            $criva = $criva -replace '[a-z]',$split
            $criva2 = $criva.Split($split)
            $date = Get-Date -Format dd/MM/yy
            for($token = 0; $token -le ($criva2.Length - 1);$token++){
                #Write-Host $criva2[$token]
                #Write-Host $token

                $criva2[$token] = "$token\$date\" + $criva2[$token] +"\1-"
                $criva2[$token] | Out-File -FilePath $url -Append -NoNewline
            }
            pause;
            }
            break;
          }
        4 {
            #$rute = Read-Host "especifique la ruta"
            $criva = Get-Content -Path $url;
            $criva = $criva.Split($split);
            $conteo = 0..$long_List
            do{
                Clear-Host;
                $criva[$conteo]
                $entry = Read-Host "Escriba la opcion que quiera ([u]p/[d]own/[s]alir/numero)"
                if ($entry -contains "u") {
                    for($token = 0; ($token -le ($conteo.Length - 1)) -and ($token -le $criva.Length); $token++ ){
                        $conteo[$token] = $conteo[$token] + $conteo.Length
                    }
                }elseif (($entry -contains "d") -and ($conteo[0] -ne 0)) {
                    for($token = 0; $token -le ($conteo.Length - 1); $token++ ){
                        $conteo[$token] = $conteo[$token] - $conteo.Length
                    }
                }elseif ($conteo -contains $entry){
                    $criva2 = $criva[$entry].Split("\");
                    $number = $criva2[2];
                    [System.Diagnostics.Process]::Start("firefox.exe","-private-window https://google.com/$number")
                }

            }Until($entry -contains "s")
            pause;
            break;
          }
        5 {
            [System.Diagnostics.Process]::Start("firefox.exe","-private-window www.google.com")
            #cmd /c start shell:AppsFolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge -private http:\\google.com
            #$WshShell = New-Object -ComObject WScript.Shell
            #$Shortcut = $WshShell.CreateShortcut("C:\Users\Batur\Desktop\ColorPix.lnk")
            #$Shortcut.TargetPath = %windir%\System32\cmd.exe /c start shell:AppsFolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge -private
            #$Shortcut.Save();
          }
        default {
            if ($entry -ne "salir") {
                Write-Host "Seleccione una opcion valida."
                pause;
            }
        }
    }
}