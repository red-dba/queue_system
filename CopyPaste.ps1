# ======================================================================================================================================================
# NAME: CopyPaste.ps1
# AUTEUR: Johan JEZEQUEL
# DATE: 26/06/2019
#
# VERSION 4.0
# COMMENTS: Fonction générique qui copie colle les fichiers dont la source, la destination et le filtre sont passés en paramètres.
# Cette fonction peut être appelée DIRECTEMENT en local, 
# et EN PASSANT PAR LE MÉCANISME COPYPASTE_RESEAU à partir d'un job si l'un des chemin est un chemin réseau.
#
#Requires -Version 4.0
# Modification JJ/MM/AAAA : ?? : 
# ======================================================================================================================================================

Function CopyPaste {
	
	Param(
		[parameter(Mandatory=$true)][string]$inputPath,
		[parameter(Mandatory=$true)][string]$outputPath,
		[parameter(Mandatory=$true)][string]$filePattern
	)

	# Fichier Log :
	$fichierLOG = "K:\saved\LOG\Rapport_CopyPaste.log"
	
	$(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') + '*** DEBUT LOG ***' | Out-File $fichierLOG -Append
	$(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') + 'Debut de la fonction CopyPaste' | Out-File $fichierLOG -Append
	
	# On vérifie que le répertoire input passé en paramètre existe
	If ((Test-Path $inputPath) -eq $False) 
	{
		Write-host $(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') "Le répertoire input  " $inputPath "n existe pas."
		$(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') + 'Le répertoire input  ' + $inputPath + 'n existe pas.' | Out-File $fichierLOG -Append
		return $false
	}
	# On vérifie que le répertoire output passé en paramètre existe
	If ((Test-Path $outputPath) -eq $False) 
	{
		Write-host $(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') "Le répertoire output  " $outputPath "n existe pas."
		$(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') + 'Le répertoire output  ' + $outputPath + 'n existe pas.' | Out-File $fichierLOG -Append
		return $false
	}
	
	# On récupère la taille des fichiers à copier
	$tailleFichiers = GetTailleFichiers_TECH_CalculTaille $inputPath
	# On ajoute 20% par sécurité
	#Write-host $tailleFichiers 
	$tailleFichiers = $tailleFichiers * 1.2
	# Write-host $tailleFichiers 
	
	# pas de vérification de l'espace libre sur le répertoire de destination (pas fiable), on supprime les fichiers spectres quoiqu'il arrive!
	# RF_SuppressionDesFichiersSpectres  "P:\APPRO PROLOG\COMPO DE STOCK\ARCHIVES" $tailleFichiers
	
	# Copie des fichiers
	Write-host $inputPath$
	Write-host filePattern 
	Write-host $outputPath 
	
	Copy-Item -Path $inputPath$filePattern -Destination $outputPath 
	
	$(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') + 'Traitement termine' | Out-File $fichierLOG -Append
	$(Get-Date -format '[dd/MM/yyyy HH:mm:ss] - ') + '*** FIN LOG ***' | Out-File $fichierLOG -Append
	

}

#CopyPaste 'W:\TECH', 'P:\Analyse End To End\Service\01 - Equipe\Johan\temp', '*.jpg'
