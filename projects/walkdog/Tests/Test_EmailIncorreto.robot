*** Settings ***
Documentation    Test Email incorreto

Resource    ../Resources/Keywords/base.resource
Test Setup       Start session     EMAIL_invalido
Test Teardown    Finish session    EMAIL_invalido.png


*** Variables ***
${VALID_NAME}             John Doe
${INVALID_EMAIL}          johndoeexample.com
${VALID_CPF}              14849466850
${VALID_NUMERO}           1452
${VALID_CEP}              87301162
${VALID_COMPLEMENTO}      Bloco 3


*** Test Cases ***
CT003: Email incorreto
    [Tags]    email_inv
    [Documentation]    Email incorreto

    Remove Files      ${EXECDIR}/logs/EMAIL_invalido*.gif    ${EXECDIR}/logs/EMAIL_invalido.png
    @{json_data}=    Load JSON Data
    Fill signup form    
    ...    ${json_data[1]['Name']}    ${json_data[1]['Email']}    ${json_data[1]['CPF']}    ${json_data[1]['CEP']}
    ...    ${json_data[1]['AddressNumber']}    ${json_data[1]['AddressDetails']}
    
    Submit signup form

    Alert have text    ${MSG_EMAIL_INVALIDO}    EMAIL_incorreto.png