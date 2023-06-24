# =======================================================
# NAME: GetConfigFromConfigFile
# AUTEUR: Johan JEZEQUEL (d'après John BENAVIDES)
# DATE: 08/02/2017
#
# VERSION 2.0
# COMMENTS: Récupère la valeur pour un paramètre donné dans un fichier de config, lui aussi fourni en paramètre
#
#Requires -Version 4.0
# Modification ??/??/???? : ?? : 
# =======================================================
Function GetConfigFromConfigFile ##Accède au fichier de config fourni en paramètre pour récupérer un paramètre dont le nom nous est fournie
{
    Param(
		[parameter(Mandatory=$true)][string]$configFile,
		[parameter(Mandatory=$true)][string]$name
	)
	
	## On teste l'existence du fichier de config
	If (-NOT (Test-Path $configFile)){
		Write-Host "fichier demandé" $configFile
		Write-Host "Erreur : Fichier de configuration manquant!"
		return $false
	}
	
	## On charge le fichier et on le parcourt pour trouver le paramètre
	$data = Get-Content $configFile
    $result = $NULL
    foreach($line in $data) {
		## Si la ligne contient ## alors c'est une ligne de commentaires et il ne faut pas la prendre en compte
        if(-not ($line -match ".*##.*")) {
			## Si la ligne commence avec le nom du paramètre, on récupère tout ce qui se situe après le symbole =
            if($line -match "$name=(.+)") {
                $result = $Matches[1]
            }
        }
    }
	
	## Si le fichier ne contient pas le paramètre, on lance une erreur
    if(!$result) {
		throw "Config parameters $name does not exist in $configFile"
    }
    Return $result
}