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
# =================================================================================================================
Import-module K:\saved\scripts\GetInformationsConnexion.ps1 -Force
Import-module .\CopyPaste_reseau.ps1 -Force

#Calcul de la semaine en cours
$NumeroDeSemaine = Get-Date -UFormat %V
$NumeroDeSemaine = $NumeroDeSemaine  -as [int]


$NumeroAnnee = Get-Date -Format "yyyy"

$NumeroDeSemaine = '00'+$NumeroDeSemaine -as [string]
$NumeroDeSemaine =  $NumeroDeSemaine.substring( ($NumeroDeSemaine.length) -2, 2)
$NumeroDeSemaineComplet = 'S_' + $NumeroAnnee + $NumeroDeSemaine

CopyPaste_reseau "W:\NASweb\out\TRACA\" "P:\APPRO PROLOG\Requete_manquants\4-VALIDATION_SEM_AV_17H00\$NumeroDeSemaineComplet\" "2898_MQT_RECAP_CONSO*.xlsx"
CopyPaste_reseau "W:\NASweb\out\TRACA\" "P:\APPRO PROLOG\Requete_manquants\4-VALIDATION_SEM_AV_17H00\$NumeroDeSemaineComplet\" "2898_MQT_RECAP_FRAIS*.xlsx"
CopyPaste_reseau "W:\NASweb\out\TRACA\" "P:\APPRO PROLOG\Requete_manquants\4-VALIDATION_SEM_AV_17H00\$NumeroDeSemaineComplet\" "2898_MQT_RECAP_MONTEL*.xlsx"
CopyPaste_reseau "W:\NASweb\out\TRACA\" "P:\APPRO PROLOG\Requete_manquants\4-VALIDATION_SEM_AV_17H00\$NumeroDeSemaineComplet\" "2898_MQT_RECAP_PARAPHARMACIE*.xlsx"
CopyPaste_reseau "W:\NASweb\out\TRACA\" "P:\APPRO PROLOG\Requete_manquants\4-VALIDATION_SEM_AV_17H00\$NumeroDeSemaineComplet\" "2898_MQT_RECAP_COORDINATION*.xlsx"
CopyPaste_reseau "W:\NASweb\out\TRACA\" "P:\APPRO PROLOG\Requete_manquants\4-VALIDATION_SEM_AV_17H00\$NumeroDeSemaineComplet\" "2898_MQT_RECAP_DPH*.xlsx"
CopyPaste_reseau "W:\NASweb\out\TRACA\" "P:\APPRO PROLOG\Requete_manquants\4-VALIDATION_SEM_AV_17H00\$NumeroDeSemaineComplet\" "2898_MQT_RECAP_EPICERIE*.xlsx"
CopyPaste_reseau "W:\NASweb\out\TRACA\" "P:\APPRO PROLOG\Requete_manquants\4-VALIDATION_SEM_AV_17H00\$NumeroDeSemaineComplet\" "2898_MQT_RECAP_SEC_NONAL.xlsx"
CopyPaste_reseau "W:\NASweb\out\TRACA\" "P:\APPRO PROLOG\Requete_manquants\4-VALIDATION_SEM_AV_17H00\$NumeroDeSemaineComplet\" "2898_MQT_RECAP_SURGELE.xlsx"
CopyPaste_reseau "W:\NASweb\out\TRACA\" "P:\APPRO PROLOG\Requete_manquants\4-VALIDATION_SEM_AV_17H00\$NumeroDeSemaineComplet\" "2898_MQT_RECAP_LIQUIDE.xlsx"

CopyPaste_reseau "W:\NASweb\out\TRACA\" "S:\9-NEW-MANQUANTS Traca\4-VALIDATION_SEM_AV_17H\$NumeroDeSemaineComplet\" "2899_MQT_RECAP_NONAL*.xlsx"