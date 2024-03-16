   @echo off 
    setlocal enabledelayedexpansion

    echo Entrez le numéro de la run à laquelle vous voulez screenshot régulièrement :
    set /p run=

    echo Combien de fois voulez vous screenshot?
    set /p nombre=

    VboxManage startvm "Run%run%-Web1"
    VboxManage startvm "Run%run%-Web2"
    VboxManage startvm "Run%run%-SQL1"
        for /L %%i in (1,1,%nombre%) do (
            vboxmanage controlvm "Run%run%-Web1" screenshotpng "C:\Users\but-info\Documents\SAE1.03\Screenshot\capture0%%i.png"  
            vboxmanage controlvm "Run%run%-Web2" screenshotpng "C:\Users\but-info\Documents\SAE1.03\Screenshot\capture00%%i.png"
            vboxmanage controlvm "Run%run%-SQL1" screenshotpng "C:\Users\but-info\Documents\SAE1.03\Screenshot\capture000%%i.png"
            TIMEOUT /T 300
        )


    