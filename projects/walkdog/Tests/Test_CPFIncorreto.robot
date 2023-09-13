*** Settings ***
Documentation    Test CPF incorreto

Resource    ../Resources/Keywords/base.resource
Test Setup       Start session    CPF_Invalido
Test Teardown    Finish session    CPF_Invalido.png


*** Variables ***
${VALID_NAME}             John Doe
${VALID_EMAIL}            johndoe@example.com
${INVALID_CPF}            0000001a
${VALID_NUMERO}           1452
${VALID_CEP}              87301162
${VALID_COMPLEMENTO}      Bloco 3
${DOCUMENT}               ${EXECDIR}/fixtures/document.png


*** Test Cases ***

CT002: CPF incorreto
    [Tags]    cpf_inv
    [Documentation]    CPF incorreto
    Remove Files      ${EXECDIR}/logs/CPF_Invalido*.gif    ${EXECDIR}/logs/CPF_Invalido.png

    @{json_data}=    Load JSON Data
    Fill signup form    
    ...    ${json_data[2]['Name']}    ${json_data[2]['Email']}    ${json_data[2]['CPF']}    ${json_data[2]['CEP']}
    ...    ${json_data[2]['AddressNumber']}    ${json_data[2]['AddressDetails']}
    
    Submit signup form

    Alert have text    ${MSG_CPF_INVALIDO}    CPF_incorreto.png