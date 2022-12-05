Set-ExecutionPolicy –ExecutionPolicy RemoteSigned



function E1 {

    $fecha=Get-Date -Format "ddMMyyyy"

    $fecha = $fecha + ".txt"
   
    $ruta = 'C:\Logs_Backups\Log_Backup_Pause_' + $fecha 

  
    Write-output " " | Out-File -FilePath $ruta -Append -Force
    Write-output " " | Out-File -FilePath $ruta -Append -Force
    Write-output " ***Ocurrio un error. Revisar el log*** " | Out-File -FilePath $ruta  -Append -Force 
  
   
    
}




function  DiskG {
    
    $fecha=Get-Date -Format "ddMMyyyy"

    $fecha = $fecha + ".txt"
   
    $ruta = 'C:\Logs_Backups\Log_Backup_Pause_' + $fecha 


    Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath $ruta 
    
    Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
    write-output  " " | Out-File -FilePath  $ruta  -Append -Force
    Write-output "***************************************************************************" | Out-File -FilePath $ruta -Append -Force
    Write-Output "* Script para Iniciar shadowcopy y SQL Lakin Banco con Veeam v.12 *" | Out-File -FilePath  $ruta  -Append -Force
    Write-Output "* Manual Doc *" | Out-File -FilePath  $ruta  -Append -Force
    Write-output "***************************************************************************" | Out-File -FilePath $ruta -Append -Force
    Write-output " " | Out-File -FilePath  $ruta  -Append -Force
    Write-output " " | Out-File -FilePath $ruta  -Append -Force
    Write-output " " | Out-File -FilePath  $ruta   -Append -Force
    
    try{

        Write-output "----------------------------------------------------------------------------------------------------" | Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
        Write-output "***Se inicia la creación de Shadow Copy en G:\*** "| Out-File -FilePath  $ruta   -Append -Force
        
        
        try{
          

        vssadmin Create Shadow /For=G:| Out-File -FilePath  C:\Utilerias\Scripts-Backup-FRDMTP0224\Shadows_Copy\ShadowCopyG.txt   -Append -Force
          $prueba=$?  
       
         if( $prueba -eq 0 ){
          
           Write-Output " "  | Out-File -FilePath  $ruta   -Append -Force
           Write-Output "Mas informacion revisar el ShadowCopy Unidad" | Out-File -FilePath  $ruta   -Append -Force

           E1

         }else{

          Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
          Write-Output " "  | Out-File -FilePath  $ruta   -Append -Force
          Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath  $ruta   -Append -Force
          Get-Date -Format "HH:mm" | Out-File -FilePath $ruta -Append -Force
          Write-Output "***Se finaliza la creación de Shadow Copy en G:\***" | Out-File -FilePath  $ruta   -Append -Force
          Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
          Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
      
        }


        }catch{

          Write-Host $_  # atrapa el error para imprimir en consola si no se crea

        }
        
      
    }catch{
        
        Write-Host $_ # atra algun erro por que nose cree el archivo de manera correcta
       
    }
  
 
}




function DiskI {

    $fecha=Get-Date -Format "ddMMyyyy"

    $fecha = $fecha + ".txt"
   
    $ruta = 'C:\Logs_Backups\Log_Backup_Pause_' + $fecha 

 
    try{
        Write-output "----------------------------------------------------------------------------------------------------" | Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "HH:mm"| Out-File -FilePath  $ruta   -Append -Force
        Write-output "***Se inicia la creación de Shadow Copy en I:\*** " | Out-File -FilePath  $ruta   -Append -Force
        vssadmin Create Shadow /For=I:| Out-File -FilePath  C:\Utilerias\Scripts-Backup-FRDMTP0224\Shadows_Copy\ShadowCopyI.txt   -Append -Force
        $prueba=$?   
     

        if( $prueba -eq 0 ){
          Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
          Write-Output "Mas informacion revisar el ShadowCopy Unidad"| Out-File -FilePath  $ruta   -Append -Force
          E1

        }else{

         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath  $ruta   -Append -Force
         Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
         Write-Output "***Se finaliza la creación de Shadow Copy en I:\***"  | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
        
        }


    }catch{
        
        Write-Host $_
       
    }

}


function DiskK {

    $fecha=Get-Date -Format "ddMMyyyy"

    $fecha = $fecha + ".txt"
   
    $ruta = 'C:\Logs_Backups\Log_Backup_Pause_' + $fecha 
 
    try{
        Write-output "----------------------------------------------------------------------------------------------------"| Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
        Write-output "***Se inicia la creación de Shadow Copy en K:\*** " | Out-File -FilePath  $ruta   -Append -Force
        vssadmin Create Shadow /For=K: | Out-File -FilePath  C:\Utilerias\Scripts-Backup-FRDMTP0224\Shadows_Copy\ShadowCopyK.txt
        $prueba=$?   
       
        

        if( $prueba -eq 0 ){
           
          Write-Output " "| Out-File -FilePath  $ruta   -Append -Force
          Write-Output "Mas informacion revisar el ShadowCopy Unidad" | Out-File -FilePath  $ruta   -Append -Force
          E1

        }else{

         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Get-Date -Format "dd/MM/yyyy"| Out-File -FilePath  $ruta   -Append -Force
         Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
         Write-Output "***Se finaliza la creación de Shadow Copy en K:\***"  | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
        

        }


    }catch{
        
        Write-Host $_
       
    }

}


function DiskJ {

    $fecha=Get-Date -Format "ddMMyyyy"

    $fecha = $fecha + ".txt"
   
    $ruta = 'C:\Logs_Backups\Log_Backup_Pause_' + $fecha 
 
    try{
        Write-output "----------------------------------------------------------------------------------------------------"| Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
        Write-output "***Se inicia la creación de Shadow Copy en J:\*** " | Out-File -FilePath  $ruta   -Append -Force
        vssadmin Create Shadow /For=J: | Out-File -FilePath  C:\Utilerias\Scripts-Backup-FRDMTP0224\Shadows_Copy\ShadowCopyJ.txt
        $prueba=$?   


        if( $prueba -eq 0 ){
          Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
          Write-Output "Mas informacion revisar el ShadowCopy Unidad" | Out-File -FilePath  $ruta   -Append -Force
          E1

        }else{

         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath  $ruta   -Append -Force 
         Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
         Write-Output "***Se finaliza la creación de Shadow Copy en J:\***"  | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " |Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " |Out-File -FilePath  $ruta   -Append -Force
        
        }


    }catch{
        
        Write-Host $_
       
    }

}

function DiskS {


    $fecha=Get-Date -Format "ddMMyyyy"

    $fecha = $fecha + ".txt"
   
    $ruta = 'C:\Logs_Backups\Log_Backup_Pause_' + $fecha 
 
    try{
        Write-output "----------------------------------------------------------------------------------------------------" | Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
        Write-output "***Se inicia la creación de Shadow Copy en S:\*** " | Out-File -FilePath  $ruta   -Append -Force
        vssadmin Create Shadow /For=S: | Out-File -FilePath  C:\Utilerias\Scripts-Backup-FRDMTP0224\Shadows_Copy\ShadowCopyS.txt
        $prueba=$?   
       
        if( $prueba -eq 0 ){
          Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
          Write-Output "Mas informacion revisar el ShadowCopy Unidad" | Out-File -FilePath  $ruta   -Append -Force
          E1

        }else{

         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath  $ruta   -Append -Force
         Get-Date -Format "HH:mm"| Out-File -FilePath  $ruta   -Append -Force
         Write-Output "***Se finaliza la creación de Shadow Copy en S:\***" | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
    

        }


    }catch{
        
        Write-Host $_
       
    }

}



function SQLServer {

    
    $fecha=Get-Date -Format "ddMMyyyy"

    $fecha = $fecha + ".txt"
   
    $ruta = 'C:\Logs_Backups\Log_Backup_Pause_' + $fecha 
 
    try{
        Write-output "----------------------------------------------------------------------------------------------------"| Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "dd/MM/yyyy" | Out-File -FilePath  $ruta   -Append -Force
        Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
        Write-output " Se inician servicios SQL para MSSQLSERVER " | Out-File -FilePath  $ruta   -Append -Force
        Write-Host "--------------------------------------------------------------"
        Write-Host "Se inician servicios SQL para MSSQLSERVER" 
        Write-Host "--------------------------------------------------------------"
        Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
        Write-Output " " | Out-File -FilePath  $ruta   -Append -Force

        Start-Service -DisplayName "SQL Server (MSSQLSERVER)" | Out-File -FilePath  $ruta   -Append -Force
        $prueba=$? 
        Start-Service -DisplayName "SQL Server Agent (MSSQLSERVER)" | Out-File -FilePath  $ruta   -Append -Force
        $prueba2=$?   
       
        if( $prueba -eq 0 -Or $prueba2 -eq 0){
          Write-Output " " | Out-File -FilePath C:\Logs_Backups\Log_Backup_Pause.txt -Append -Force
          Write-Output "Error de SQL Server" | Out-File -FilePath C:\Logs_Backups\Log_Backup_Pause.txt -Append -Force
          E1

        }else{

         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Get-Date -Format "dd/MM/yyyy"| Out-File -FilePath  $ruta   -Append -Force
         Get-Date -Format "HH:mm" | Out-File -FilePath  $ruta   -Append -Force
         Write-Output "***Se finaliza inicio de servicios de SQL para MSSQLSERVER*"  | Out-File -FilePath  $ruta   -Append -Force
         Write-Host "--------------------------------------------------------------"
         Write-Host "***Se finaliza inicio de servicios de SQL para MSSQLSERVER*"
         Write-Host "--------------------------------------------------------------"
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Write-Output " " | Out-File -FilePath  $ruta   -Append -Force
         Write-Output "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" | Out-File -FilePath  $ruta   -Append -Force
          

        }


    }catch{
        
        Write-Host $_
       
    }

}








function principal {
  
    DiskG
    DiskI
    DiskK
    DiskJ
    DiskS
    SQLServer
    


}


principal

