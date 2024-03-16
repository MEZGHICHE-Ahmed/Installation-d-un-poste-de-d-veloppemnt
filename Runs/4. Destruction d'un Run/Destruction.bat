   @echo off 
    setlocal enabledelayedexpansion

    echo Entrez le numéro de la run que vous voulez détruire :
    set /p run=

    vboxmanage unregistervm "Run%run%-Web1" --delete 
    vboxmanage unregistervm "Run%run%-Web2" --delete 
    vboxmanage unregistervm "Run%run%-SQL1" --delete 

    echo Run détruite avec succès