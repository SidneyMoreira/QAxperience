*** Settings ***
Documentation    Page Object for Dog Walker Registration Page

Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
# CSS Selectors
${DELAY}                    2s
${CSS_NAME}                 xpath=//input[@name='name']
${CSS_EMAIL}                xpath=//input[@name='email']
${CSS_CPF}                  xpath=//input[@name='cpf']
${CSS_CEP}                  xpath=//input[@name='cep']
${CSS_ADDRESS_NUMBER}       xpath=//input[@name="addressNumber"]
${CSS_ADDRESS_DETAILS}      xpath=//input[@name="addressDetails"]
${CSS_ADDRESS_STREET}       xpath=//input[@name="addressStreet"]
${CSS_ADDRESS_DISTRICT}     xpath=//input[@name="addressDistrict"]
${CSS_ADDRESS_CITY_UF}      xpath=//input[@name="addressCityUf"]
${CSS_UPLOAD_FILE}          xpath=//input[@type="file"]
${CSS_SUBMIT}               xpath=//button[contains(text(),'Cadastrar')]
${BUSCAR_CEP}               xpath=//input[contains(@value,'Buscar CEP')]
${BTN_VOLTAR}               xpath=//button[contains(text(),'Voltar')]
${POPUP_MSG_SUCCESS}        xpath=//div[@class='swal2-html-container']
${DOCUMENT}                 ${EXECDIR}/fixtures/document.png

*** Keywords ***
Fill signup form
    [Arguments]    ${name}    ${email}    ${cpf}    ${cep}    ${addressNumber}    ${complement}
    Input Text        ${CSS_NAME}                ${name}       
    Input Text        ${CSS_EMAIL}               ${email}      
    Input Text        ${CSS_CPF}                 ${cpf}        
    Input Text        ${CSS_CEP}                 ${cep}
    Input Text        ${CSS_ADDRESS_NUMBER}      ${addressNumber}        
    Input Text        ${CSS_ADDRESS_DETAILS}     ${complement}
    Click Element     ${BUSCAR_CEP}
    Choose File       ${CSS_UPLOAD_FILE}         ${DOCUMENT}

Submit signup form
    Click Element     ${CSS_SUBMIT}
    
Popup have text
    [Arguments]    ${expect_text}
    Wait Until Element Is Visible    ${POPUP_MSG_SUCCESS}    timeout=${DELAY}
    Element Should Contain      ${POPUP_MSG_SUCCESS}    ${expect_text}

Alert have text
    [Arguments]    ${expect_text}    ${name_alert}

    ${ELEMENT}    Set Variable    xpath=//span[@class='alert-error'][text()='${expect_text}']

    Remove File    ${EXECDIR}/logs/${name_alert}

    Wait Until Element Is Visible       ${ELEMENT}    timeout=${DELAY}
    Capture Element Screenshot          ${ELEMENT}    ${name_alert}
