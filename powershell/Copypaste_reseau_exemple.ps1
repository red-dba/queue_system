# =================================================================================================================
# NAME: Copypaste_reseau_exemple.ps1
# AUTEUR: Johan JEZEQUEL
# DATE: 26/06/2019
#
# VERSION 3.0
# COMMENTS: exemple d'appel de fonction 
#
#Requires -Version 4.0
# Modification 27/06/2019 : XX : 
# =================================================================================================================
Import-module K:\saved\scripts\GetInformationsConnexion.ps1 -Force
Import-module .\CopyPaste_reseau.ps1 -Force

CopyPaste_reseau "W:\NASweb\out\COMPO\" "P:\APPRO PROLOG\COMPO DE STOCK\S06\" "*.zip"
