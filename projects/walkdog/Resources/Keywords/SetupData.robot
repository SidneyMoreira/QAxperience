*** Settings ***
Library    JSONLibrary

*** Variables ***
${DataFile}    Data/MassaDados.json

*** Keywords ***
Load JSON Data
    @{data}=    Load JSON from File    ${DataFile}
    [Return]    ${data}
