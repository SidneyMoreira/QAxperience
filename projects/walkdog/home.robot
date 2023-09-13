*** Settings ***
Documentation        Suite de testes da pagina principal.
Library              SeleniumLibrary

*** Test Cases ***
Webapp deve estar online
    Open Browser           https://walkdog.vercel.app/    Chrome
    #Maximize Browser Window
    Title Should Be        Walkdog by Papito
    Page Should Contain    Cuidado e diversão em cada passo

*** Keywords ***
Fechar Navegador
    Sleep    5
    Close Browser
