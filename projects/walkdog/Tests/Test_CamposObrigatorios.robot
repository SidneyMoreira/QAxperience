*** Settings ***
Documentation    Test Campos obrigatórios

Resource    ../Resources/Keywords/base.resource

Test Setup       Start session    CamposObrigatorios
Test Teardown    Finish session    CamposObrigatorios.png

*** Test Cases ***
 
CT004: Campos obrigatórios
    [Tags]    require
    [Documentation]    Campos obrigatórios
    Remove Files      ${EXECDIR}/logs/CamposObrigatorios_*.gif
    ...    ${EXECDIR}/logs/CamposObrigatorios.png

    Submit signup form

    Alert have text     ${MSG_NOME_COMPL}    Nome_obrigatorio.png
    Alert have text     ${MSG_EMAIL_MELHOR}  Email_obrigatorio.png
    Alert have text     ${MSG_CPF}           CPF_obrigatorio.png
    Alert have text     ${MSG_CEP}           CEP_obrigatorio.png
    Alert have text     ${MSG_NUMERO}        Numero_obrigatorio.png
    Alert have text     ${MSG_DOCUMENT}      Document_obrigatorio.png