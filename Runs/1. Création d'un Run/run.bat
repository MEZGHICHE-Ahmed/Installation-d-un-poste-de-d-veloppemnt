@echo off

REM Incrémentation de la run
setlocal enabledelayedexpansion

set "fichierValeur=valeur.txt"

rem Lire la valeur actuelle depuis le fichier
set /p valeur=<%fichierValeur%

rem Incrémenter la valeur
set /a valeur+=1

rem Enregistrer la nouvelle valeur dans le fichier
echo %valeur% > %fichierValeur%

echo Lancement de la Run (Nombre de Run crée : %valeur%)

VBoxManage clonevm "Web" --name="Run%valeur%-Web1" --register --mode=all --options=keepallmacs --options=keepdisknames --options=keephwuuids
VBoxManage clonevm "Web2" --name="Run%valeur%-Web2" --register --mode=all --options=keepallmacs --options=keepdisknames --options=keephwuuids
VBoxManage clonevm "SQL1" --name="Run%valeur%-SQL1" --register --mode=all --options=keepallmacs --options=keepdisknames --options=keephwuuids

    REM Première Machine 

echo (1ère Machine) Saisissez la ram (entre 4Mo et 6000Mo):
set /p Ram1=

echo (1ère Machine) Saisissez le nombre de CPU à allouer (entre 1 et 4) :
set /p CPU1=


VBoxManage modifyvm "Run%valeur%-Web1" --memory %Ram1%
VBoxManage modifyvm "Run%valeur%-Web1" --cpus %CPU1%

echo Voulez vous démarrer la machine ? (Rentrez 1 pour Oui / Autre pour Non )
set /p Launch1=

if %Launch1% equ 1 (
    echo Lancement en cours de la machine
    VboxManage startvm "Run%valeur%-Web1"
) else (
    echo Lancement de la machine annulé
)


REM Deuxième Machine

echo (2ème Machine) Saisissez la ram (entre 4Mo et 6000Mo):
set /p Ram2=

echo (2ème Machine) Saisissez le nombre de CPU à allouer (entre 1 et 4) :
set /p CPU2=
VBoxManage modifyvm "Run%valeur%-Web2" --memory %Ram2%
VBoxManage modifyvm "Run%valeur%-Web2" --cpus %CPU2%

echo Voulez vous démarrer la machine ? (Rentrez 1 pour Oui / Autre pour Non )
set /p Launch2=

if %Launch2% equ 1 (
    echo Lancement en cours de la machine
    VboxManage startvm "Run%valeur%-Web2"
) else (
    echo Lancement de la machine annulé
)

REM 3ème Machine

echo (3ème Machine) Saisissez la ram (entre 4Mo et 6000Mo):
set /p Ram3=

echo (3ème Machine) Saisissez le nombre de CPU à allouer (entre 1 et 4) :
set /p CPU3=
VBoxManage modifyvm "Run%valeur%-SQL1" --memory %Ram3%
VBoxManage modifyvm "Run%valeur%-SQL1" --cpus %CPU3%


echo Voulez vous démarrer la machine ? (Rentrez 1 pour Oui / Autre pour Non )
set /p Launch2=

if %Launch2% equ 1 (
    echo Lancement en cours de la machine
    VboxManage startvm "Run%valeur%-SQL1"
) else (
    echo Lancement de la machine annulé
)