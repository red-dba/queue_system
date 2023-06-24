# ======================================================================================================================================================
# NAME: CopyPaste_reseau.ps1
# AUTEUR: Johan JEZEQUEL
# DATE: 26/06/2019
#
# VERSION 4.0
# COMMENTS: Fonction qui, lors d'un copier coller dont l'un des chemins est sur le réseau, inscrit dans la table t_copie_fichiers_sur_reseau_sched
# les informations suivantes :  la source, la destination et le filtre.
# Ensuite, une tâche planifié (CopyPaste_Robot) vient lire les informations de la table, effectue le copier coller véritable et met à jour la table avec un statut 2 effectué.
#
#Requires -Version 4.0
# Modification JJ/MM/AAAA : ?? : 
# ======================================================================================================================================================

function CopyPaste_reseau {
	
	Param(
		[parameter(Mandatory=$true)][string]$inputPath,
		[parameter(Mandatory=$true)][string]$outputPath,
		[parameter(Mandatory=$true)][string]$filePattern
	)

	# Write-Host $inputPath
	# Write-Host $outputPath
	# Write-Host $filePattern
	
	# On vérifie que le fichier passé en paramètre existe
	# IF ((TEST-PATH $configFile) -EQ $FALSE) 
	# {
		# WRITE-HOST $(GET-DATE -FORMAT '[DD/MM/YYYY HH:MM:SS] - ') "LE FICHIER DE CONFIGURATION " $configFile "N EXISTE PAS."
		# RETURN $FALSE
	# # }
	
	# Fichier Log :
	$fichierLOG = "K:\saved\LOG\Rapport_CopyPaste_reseau.log"
	
	$(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') + '*** DEBUT LOG ***' | Out-File $fichierLOG -Append
	$(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') + 'Debut de la fonction CopyPaste_reseau ' | Out-File $fichierLOG -Append
	
	# On récupère les informations de connexion
	GetInformationsConnexion
	
	
	# ELEMENTS DE LA BASE :
	
	$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
	$SqlConnection.ConnectionString = "Server=$Global:server;Database=TX;User Id=$Global:loginUser;Password=$Global:passwordUser;Integrated Security=False"
	#$SqlConnection.user = $Global:loginUser
	#$SqlConnection.password = $Global:passwordUser
	$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
	$SqlCmd.CommandText = "sp_add_copie_fichiers_sur_reseau_sched"
	$SqlCmd.Connection = $SqlConnection
	$SqlCmd.CommandType = [System.Data.CommandType]'StoredProcedure'; 
	Write-host $status
	
	# inputPath
	$inParameter = new-object System.Data.SqlClient.SqlParameter;
	$inParameter.ParameterName = "@inputPath";
	$inParameter.Direction = [System.Data.ParameterDirection]'Input';
	$inParameter.DbType = [System.Data.DbType]'String';
	$inParameter.Size = 512;
	$inParameter.Value = $inputPath;
	$SqlCmd.Parameters.Add($inParameter) >> $null;
	
	# outputPath
	$inParameter = new-object System.Data.SqlClient.SqlParameter;
	$inParameter.ParameterName = "@outputPath";
	$inParameter.Direction = [System.Data.ParameterDirection]'Input';
	$inParameter.DbType = [System.Data.DbType]'String';
	$inParameter.Size = 255;
	$inParameter.Value = $outputPath;
	$SqlCmd.Parameters.Add($inParameter) >> $null;
	
	# @filePattern
	$inParameter = new-object System.Data.SqlClient.SqlParameter;
	$inParameter.ParameterName = "@filePattern";
	$inParameter.Direction = [System.Data.ParameterDirection]'Input';
	$inParameter.DbType = [System.Data.DbType]'String';
	$inParameter.Size = 255;
	$inParameter.Value = $filePattern;
	$SqlCmd.Parameters.Add($inParameter) >> $null;
	
	$SqlConnection.Open();
	$result = $SqlCmd.ExecuteNonQuery();
	
	$SqlConnection.Close();
	
	$(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') + 'Traitement termine' | Out-File $fichierLOG -Append
	$(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') + '*** FIN LOG ***' | Out-File $fichierLOG -Append
	
}

#CopyPaste_reseau 'W:\TECH', 'P:\Analyse End To End\Service\01 - Equipe\Johan\temp', '*.jpg'
