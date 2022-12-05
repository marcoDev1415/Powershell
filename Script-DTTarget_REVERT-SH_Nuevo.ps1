
Set-ExecutionPolicy –ExecutionPolicy RemoteSigned


function Fecha {
  
    $fecha=Get-Date -Format "ddMMyyyy"

    $fecha = $fecha + ".txt"
   
    $ruta = 'C:\Logs_Backups\Log_Backup_Resume_' + $fecha 

    return  $ruta 
}


function E1 {


    $ruta = Fecha

  
    Write-output " " | Out-File -FilePath $ruta -Append -Force
    Write-output " " | Out-File -FilePath $ruta -Append -Force
    Write-output " ***Ocurrio un error. Revisar el log*** " | Out-File -FilePath $ruta  -Append -Force 
  
   
    
}

function Bienvenida{

    $ruta=Fecha

   
    Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta    
    Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
    Write-output " " | Out-File -FilePath $ruta  -Append -Force
    Write-output " ***************************************************************************** " | Out-File -FilePath $ruta  -Append -Force
    Write-output "  * Script para Revertir shadowcopy y bajar servicios SQL Lakin Banco  v.12 * " | Out-File -FilePath $ruta  -Append -Force
    Write-output " ***************************************************************************** " | Out-File -FilePath $ruta  -Append -Force
    Write-output " " | Out-File -FilePath $ruta -Append -Force
    Write-output " " | Out-File -FilePath $ruta -Append -Force
    Write-output "--------------------------------------------------------------------------------------------------- " | Out-File -FilePath $ruta -Append -Force

   
    

}

function Denetener_servicioSQL {
    
    $ruta=Fecha

    Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta   -Append -Force  
    Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
    Write-output " ***Se detienen servicios de SQL para MSSQLSERVER.*** " | Out-File -FilePath $ruta -Append -Force
    Write-output " " | Out-File -FilePath $ruta -Append -Force
    Write-output " " | Out-File -FilePath $ruta -Append -Force
    
    Stop-Service -DisplayName "SQL Server (MSSQLSERVER)" -Force | Out-File -FilePath  $ruta   -Append -Force
    $prueba=$? 

    if($prueba -eq 0 ){

        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output "Error de no se detuvo SQL Server" | Out-File -FilePath $ruta -Append -Force
        Write-Host "Error de no se detuvo SQL Server" | Out-File -FilePath $ruta -Append -Force
        E1
    }else{

        Write-Output " " | Out-File -FilePath $ruta -Append -Force
        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta  -Append -Force    
        Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
        Write-Output "***Se finaliza detención de servicios de SQL para MSSQLSERVER.*** " | Out-File -FilePath $ruta -Append -Force
        Write-Host "***Se finaliza detención de servicios de SQL para MSSQLSERVER.***" | Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output "----------------------------------------------------------------------------------------------------"| Out-File -FilePath $ruta -Append -Force
    }
    

}

function  DiskG {
   
    $ruta=Fecha

    Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta  -Append -Force    
    Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force


    $res=Select-String -Path C:\Utilerias\Scripts-Backup-FRDMTP0224\Shadows_Copy\ShadowCopyG.txt -Pattern "ID" | select line
    $res = $res -split " "
    $res = $res.get(7)
    $ShCoIDG= $res -replace ".$"


    Write-Output " ***Se inicia la reversión de Shadow Copy en G:\*** "| Out-File -FilePath $ruta -Append -Force
    Write-Host " ***Se inicia la reversión de Shadow Copy en G:\***"
    Write-Host " --------------------------------------------------"
    Write-Output " "| Out-File -FilePath $ruta -Append -Force
    Write-Output " "| Out-File -FilePath $ruta -Append -Force

	Write-Output " Shadow Copy ID G: ShCoIDG "| Out-File -FilePath $ruta -Append -Force
    Write-Host " Shadow Copy ID G: ShCoIDG "| Out-File -FilePath $ruta -Append -Force
	
	vssadmin Revert Shadow /Shadow=$ShCoIDG /ForceDismount /Quiet | Out-File -FilePath $ruta -Append -Force
    $prueba=$?   

    if( $prueba -eq 0 ){
        Write-Host " Mal"
        Write-Output "Revisar Log" | Out-File -FilePath  $ruta   -Append -Force
        Write-Host " Revisar Log"
        E1
    }else{
      
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force

        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta -Append -Force    
        Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
        Write-Output " ***Se finaliza la reversión de Shadow Copy en G:\*** "| Out-File -FilePath $ruta -Append -Force
        Write-Host " ***Se finaliza la reversión de Shadow Copy en G:\*** "
        Write-Host " --------------------------------------------------"
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
	 
    }
	


}



function  DiskI {
   
    $ruta=Fecha

    Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta   -Append -Force  
    Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force


    $res=Select-String -Path C:\Utilerias\Scripts-Backup-FRDMTP0224\Shadows_Copy\ShadowCopyI.txt -Pattern "ID" | select line
    $res = $res -split " "
    $res = $res.get(7)
    $ShCoIDI= $res -replace ".$"


    Write-Output " ***Se inicia la reversión de Shadow Copy en I:\*** "| Out-File -FilePath $ruta -Append -Force
    Write-Host " ***Se inicia la reversión de Shadow Copy en I:\***"
    Write-Host " --------------------------------------------------"
    Write-Output " "| Out-File -FilePath $ruta -Append -Force
    Write-Output " "| Out-File -FilePath $ruta -Append -Force

	Write-Output " Shadow Copy ID G: ShCoIDI "| Out-File -FilePath $ruta -Append -Force

	
	vssadmin Revert Shadow /Shadow=$ShCoIDI /ForceDismount /Quiet | Out-File -FilePath $ruta -Append -Force
    $prueba=$?   

    if( $prueba -eq 0 ){
        Write-Host " Mal"
        Write-Output "Revisar Log" | Out-File -FilePath  $ruta   -Append -Force
        Write-Host " Revisar Log"
        E1
    }else{
      
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force

        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta   -Append -Force  
        Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
        Write-Output " ***Se finaliza la reversión de Shadow Copy en I:\*** "| Out-File -FilePath $ruta -Append -Force
        Write-Host " ***Se finaliza la reversión de Shadow Copy en I:\*** "
        Write-Host " --------------------------------------------------"
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
	 
    }
	


}



function  DiskK {
   
    $ruta=Fecha

    Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta   -Append -Force  
    Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force


    $res=Select-String -Path C:\Utilerias\Scripts-Backup-FRDMTP0224\Shadows_Copy\ShadowCopyK.txt -Pattern "ID" | select line
    $res = $res -split " "
    $res = $res.get(7)
    $ShCoIDK= $res -replace ".$"


    Write-Output " ***Se inicia la reversión de Shadow Copy en K:\*** "| Out-File -FilePath $ruta -Append -Force
    Write-Host " ***Se inicia la reversión de Shadow Copy en K:\***"
    Write-Host " --------------------------------------------------"
    Write-Output " "| Out-File -FilePath $ruta -Append -Force
    Write-Output " "| Out-File -FilePath $ruta -Append -Force

	Write-Output " Shadow Copy ID G: ShCoIDK "| Out-File -FilePath $ruta -Append -Force

	
	vssadmin Revert Shadow /Shadow=$ShCoIDK /ForceDismount /Quiet | Out-File -FilePath $ruta -Append -Force
    $prueba=$?   

    if( $prueba -eq 0 ){
        Write-Host " Mal"
        Write-Output "Revisar Log" | Out-File -FilePath  $ruta   -Append -Force
        Write-Host " Revisar Log"
        E1
    }else{
      
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force

        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta   -Append -Force  
        Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
        Write-Output " ***Se finaliza la reversión de Shadow Copy en K:\*** "| Out-File -FilePath $ruta -Append -Force
        Write-Host " ***Se finaliza la reversión de Shadow Copy en K:\*** "
        Write-Host " --------------------------------------------------"
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
	 
    }
	


}



function  DiskJ {
   
    $ruta=Fecha

    Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta     -Append -Force
    Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force


    $res=Select-String -Path C:\Utilerias\Scripts-Backup-FRDMTP0224\Shadows_Copy\ShadowCopyJ.txt -Pattern "ID" | select line
    $res = $res -split " "
    $res = $res.get(7)
    $ShCoIDJ= $res -replace ".$"


    Write-Output " ***Se inicia la reversión de Shadow Copy en J:\*** "| Out-File -FilePath $ruta -Append -Force
    Write-Host " ***Se inicia la reversión de Shadow Copy en J:\***"
    Write-Host " --------------------------------------------------"
    Write-Output " "| Out-File -FilePath $ruta -Append -Force
    Write-Output " "| Out-File -FilePath $ruta -Append -Force

	Write-Output " Shadow Copy ID G: ShCoIDJ "| Out-File -FilePath $ruta -Append -Force

	
	vssadmin Revert Shadow /Shadow=$ShCoIDJ /ForceDismount /Quiet | Out-File -FilePath $ruta -Append -Force
    $prueba=$?   

    if( $prueba -eq 0 ){
        Write-Host " Mal"
        Write-Output "Revisar Log" | Out-File -FilePath  $ruta   -Append -Force
        Write-Host " Revisar Log"
        E1
    }else{
      
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force

        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta     -Append -Force
        Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
        Write-Output " ***Se finaliza la reversión de Shadow Copy en J:\*** "| Out-File -FilePath $ruta -Append -Force
        Write-Host " ***Se finaliza la reversión de Shadow Copy en J:\*** "
        Write-Host " --------------------------------------------------"
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
	 
    }
	


}


function  DiskS {
   
    $ruta=Fecha

    Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta     -Append -Force
    Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force


    $res=Select-String -Path C:\Utilerias\Scripts-Backup-FRDMTP0224\Shadows_Copy\ShadowCopyS.txt -Pattern "ID" | select line
    $res = $res -split " "
    $res = $res.get(7)
    $ShCoIDS= $res -replace ".$"


    Write-Output " ***Se inicia la reversión de Shadow Copy en S:\*** "| Out-File -FilePath $ruta -Append -Force
    Write-Host " ***Se inicia la reversión de Shadow Copy en S:\***"
    Write-Host " --------------------------------------------------"
    Write-Output " "| Out-File -FilePath $ruta -Append -Force
    Write-Output " "| Out-File -FilePath $ruta -Append -Force

	Write-Output " Shadow Copy ID G: ShCoIDS "| Out-File -FilePath $ruta -Append -Force

	
	vssadmin Revert Shadow /Shadow=$ShCoIDS /ForceDismount /Quiet | Out-File -FilePath $ruta -Append -Force
    $prueba=$?   

    if( $prueba -eq 0 ){
        Write-Host " Mal"
        Write-Output "Revisar Log" | Out-File -FilePath  $ruta   -Append -Force
        Write-Host " Revisar Log"
        E1
    }else{
      
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force

        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta   -Append -Force  
        Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
        Write-Output " ***Se finaliza la reversión de Shadow Copy en S:\*** "| Out-File -FilePath $ruta -Append -Force
        Write-Host " ***Se finaliza la reversión de Shadow Copy en S:\*** "
        Write-Host " --------------------------------------------------"
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
        Write-Output " "| Out-File -FilePath $ruta -Append -Force
	 
    }
	


}



function principal{

    Bienvenida
    Denetener_servicioSQL
    DiskG
    DiskI
    DiskK
    DiskJ
    DiskS

}

principal