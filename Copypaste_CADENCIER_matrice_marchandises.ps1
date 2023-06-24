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

CopyPaste_reseau "\\frhqmassfiles01.dg.carrefour.com\Public$\' Méthodes & Projets PGC\Référentiel\Suivi commandabilité\Task force JOURNALIERE\fichiers aides traitement des ruptures\Organisation marchandise\" "K:\saved\input\Cadencier\" "matrice marchandises.xlsx"
