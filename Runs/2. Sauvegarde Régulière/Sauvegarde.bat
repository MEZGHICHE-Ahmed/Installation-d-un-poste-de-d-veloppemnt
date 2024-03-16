   @echo off 
    setlocal enabledelayedexpansion

    echo Entrez le numéro de la run à laquelle vous voulez sauvegarder régulièrement :
    set /p run=

    echo Combien de fois voulez vous sauvegarder?
    set /p nombre=

    VboxManage startvm "Run%run%-Web1"
    VboxManage startvm "Run%run%-Web2"
    VboxManage startvm "Run%run%-SQL1"
        for /L %%i in (1,1,%nombre%) do (
            vboxmanage snapshot "Run%run%-Web1" take Sauvegarde%%i  
            vboxmanage snapshot "Run%run%-Web2" take  Sauvegarde%%i
            vboxmanage snapshot "Run%run%-SQL1" take  Sauvegarde%%i
            TIMEOUT /T 300
    
        )