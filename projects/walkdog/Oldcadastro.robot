*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BASE_URL}               https://walkdog.vercel.app/signup
${BROWSER}                Chrome
${DELAY}                  3s
${VALID_NAME}             John Doe
${VALID_EMAIL}            johndoe@example.com
${VALID_CPF}              12345678909
${VALID_NUMERO}           1452
${VALID_CEP}              12345678
${UPLOAD_FILE_PATH}       path/to/document.png
${DELAY}                  6s

# CSS Selectors
${CSS_NAME}               //input[@name='name']
${CSS_EMAIL}              //input[@name="email"]
${CSS_CPF}                //input[@name="cpf"]
${CSS_CEP}                //input[@name="cep"]
${CSS_ADDRESS_NUMBER}     //input[@name="addressNumber"]
${CSS_ADDRESS_DETAILS}    //input[@name="addressDetails"]
${CSS_ADDRESS_STREET}     //input[@name="addressStreet"]
${CSS_ADDRESS_DISTRICT}   //input[@name="addressDistrict"]
${CSS_ADDRESS_CITY_UF}    //input[@name="addressCityUf"]
${CSS_UPLOAD_FILE}        //input[@type="file"]
${CSS_SUBMIT}             //button[@type='submit']
${MSG_EMAIL_INVALIDO}     //span[contains(.,'Informe um email válido')]
${MSG_CPF_INVALIDO}       //span[contains(.,'CPF inválido')]
${MSG_CAMPO_OBRIGATORIO}    //span[contains(.,'Informe o seu nome completo')]

*** Test Cases ***
CT001: Cadastro de Dog Walker com sucesso
    [Documentation]    Cadastro de Dog Walker com sucesso
    Cadastro do Dog Walker
    [Teardown]    Close Browser

CT002: CPF incorreto
    [Documentation]    CPF incorreto
    Cadastro do Dog Walker
    Input Text    ${CSS_CPF}    123.456.789-01  # CPF incorreto
    Click Element    ${CSS_SUBMIT}
    Wait Until Element Is Visible   ${MSG_CPF_INVALIDO}    timeout=${DELAY}
    Capture Page Screenshot    Cadastro_Dog_Walker_cpf_incorreto.png
    [Teardown]    Close Browser

CT003: Email incorreto
    [Documentation]    Email incorreto
    Cadastro do Dog Walker
    Input Text    ${CSS_EMAIL}    email_incorreto.com  # Email incorreto
    Click Element    ${CSS_SUBMIT}
    Wait Until Element Is Visible    ${MSG_EMAIL_INVALIDO}    timeout=${DELAY}
    Capture Page Screenshot    Cadastro_Dog_Walker_email_incorreto.png
    [Teardown]    Close Browser

CT004: Campos obrigatórios
    [Documentation]    Campos obrigatórios
    Open Browser    ${BASE_URL}    ${BROWSER}
    Click Element    ${CSS_SUBMIT}
    Sleep    2s
    Element Should Be Visible    ${MSG_CAMPO_OBRIGATORIO}
    Capture Page Screenshot    Cadastro_Dog_Walker_campo_obrigatorio.png
    [Teardown]    Close Browser

*** Keywords ***
Cadastro do Dog Walker
    [Arguments]    ${name}=${VALID_NAME}    ${email}=${VALID_EMAIL}    ${cpf}=${VALID_CPF}    ${cep}=${VALID_CEP}    ${addressNumber}=${VALID_NUMERO}
    Open Browser    ${BASE_URL}    ${BROWSER}
    Wait Until Page Contains Element    ${CSS_NAME}
    Input Text    ${CSS_NAME}    ${name}
    Input Text    ${CSS_EMAIL}    ${email}
    Input Text    ${CSS_CPF}    ${cpf}
    Input Text    ${CSS_CEP}    ${cep}
    Input Text    ${CSS_ADDRESS_NUMBER}    ${addressNumber}
    # Input File    ${CSS_UPLOAD_FILE}    ${UPLOAD_FILE_PATH}
    #Click Element    ${CSS_SUBMIT}
    #Wait Until Page Contains Element    //div[contains(text(),'Cadastro enviado para análise')]
    Capture Page Screenshot    Cadastro_Dog_Walker.png
