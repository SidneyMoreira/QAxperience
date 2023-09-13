*** Settings ***
Documentation    Test Cadastro de Dog Walker com sucesso

Resource    ../Resources/Keywords/base.resource
Test Setup       Start session    Cadastro_Dog_Walker_Success
Test Teardown    Finish session   Cadastro_Dog_Walker_Success.png

*** Test Cases ***

CT001: Cadastro de Dog Walker com sucesso
    [Tags]    happy_path
    [Documentation]    Cadastro de Dog Walker com sucesso

    Remove Files      ${EXECDIR}/logs/Cadastro_Dog_Walker_Success*.gif    ${EXECDIR}/logs/Cadastro_Dog_Walker_Success.png
    
    @{json_data}=    Load JSON Data
    
    Fill signup form    
    ...    ${json_data[0]['Name']}    ${json_data[0]['Email']}    ${json_data[0]['CPF']}    ${json_data[0]['CEP']}
    ...    ${json_data[0]['AddressNumber']}    ${json_data[0]['AddressDetails']}
    
    Submit signup form

    Popup have text    ${MSG_SUCCESS} 