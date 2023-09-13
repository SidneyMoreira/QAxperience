*** Settings ***
Documentation        Inicialização do Projeto

Library    SeleniumLibrary
Library    OperatingSystem
Library    ScreenCapLibrary

Resource    ../PageObjects/SignupPage.robot
Resource    ../../Data/Messages.robot
Resource    SetupData.robot

*** Variables ***
${BASE_URL}               https://walkdog.vercel.app/signup
${BROWSER}                Chrome

*** Keywords ***
Start session
    [Arguments]    ${name_gif}
    
    #Inicia gravação de GIF
    Start Gif Recording    ${name_gif}
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Window Size    1920    1080

Finish session
    [Arguments]    ${name_png}
    Capture Page Screenshot    ${name_png}
    #Parar Gravação GIF
    Stop Gif Recording
    Close Browser