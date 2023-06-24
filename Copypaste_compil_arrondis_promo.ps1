# =================================================================================================================
# NAME: Copypaste_reseau_exemple.ps1
# AUTEUR: Johan JEZEQUEL
# DATE: 26/06/2019
#
# VERSION 3.0
# COMMENTS: exemple d'appel de fonction 
#
#Requires -Version 4.0
# Modification 14/01/2021 : JJ : Suite anomalie sur numéro de semaine, remplacement de %V par %W
# Modification 14/01/2021 : JJ : Suite anomalie, correctif sur format de la semaine
# Modification 03/10/2022 : JJ : Suite anomalie, correctif pour ne prendre que les fichiers de la date du jour
# =================================================================================================================
Import-module K:\saved\scripts\GetInformationsConnexion.ps1 -Force
Import-module .\CopyPaste_reseau.ps1 -Force

#Calcul de la semaine en cours
# $NumeroDeSemaine = Get-Date -UFormat %W
# $NumeroDeSemaine = Get-Date -UFormat %V
# $NumeroDeSemaine = $NumeroDeSemaine  -as [int]

# $dateDuJour=(Get-Date).tostring("yyyyMMdd")

# $NumeroAnnee = Get-Date -Format "yyyy"

# $NumeroDeSemaine = '00'+$NumeroDeSemaine -as [string]
# $NumeroDeSemaine =  $NumeroDeSemaine.substring( ($NumeroDeSemaine.length) -2, 2)
# $NumeroDeSemaineComplet = 'S_' + $NumeroAnnee + $NumeroDeSemaine

$pattern_cible = "compilation_fichiers.csv"

Remove-Item "K:\saved\input\ArrondiPromo\compilation_fichiers.csv" 

CopyPaste_reseau "P:\APPRO PROLOG\BASE ARRONDIS VENTES\Traitement_Appros_v2\csv2\" "K:\saved\input\ArrondiPromo\" $pattern_cible 
Start-Sleep -s 220