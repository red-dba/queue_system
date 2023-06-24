# =================================================================================================================
# NAME: Copypaste_CADENCIER_matrice_marchandises.ps1
# AUTEUR: Johan JEZEQUEL
# DATE: 18/12/2019
#
# VERSION 3.0
# COMMENTS: exemple d'appel de fonction 
#
#Requires -Version 4.0
# Modification 27/06/2019 : XX : 
# =================================================================================================================
Import-module K:\saved\scripts\GetInformationsConnexion.ps1 -Force
Import-module .\CopyPaste_reseau.ps1 -Force


# On calcule le filtre des fichiers que l'on va rapatrier sur le serveur
$filtre_annee = (Get-Date).AddMonths(1).ToString('yyyy')
$filtre_mois = (Get-Date).AddMonths(1).ToString('MM')
# mois moins 1 calculé
# [string]$filtre_mois_chaine = "0"+$filtre_mois 

# $filtre_mois_chaine = $filtre_mois_chaine.Substring($filtre_mois_chaine.length - 2, 2)
# u_ex190520.log

$filtre_annee_mois = $filtre_annee + '_' + $filtre_mois + '_JJ'
Write-host $filtre_annee_mois 

CopyPaste_reseau "W:\NASweb\out\CADENCIER" "P:\Analyse End To End\Aremplir\Suivi des mouvements\$filtre_annee\$filtre_annee_mois\01 - Mise a disposition Cadencier JJ\Cadencier V1 JJ\01 - SEC (par fournisseur) JJ\" "cadencier_R10_*.xlsx"
