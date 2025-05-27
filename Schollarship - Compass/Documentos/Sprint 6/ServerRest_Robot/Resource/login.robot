*** Settings ***
Library    RequestsLibrary


*** Variables ***
${email}    fulano@qa.com
${senha}    teste



*** Keywords ***
POST Endpoint /login
    &{payload}     Create Dictionary    email=${email}    senha=${senha}
    &{response}    POST On Session    ServerRest    /login    data=${payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Validar Login
    Should Be Equal As Strings    ${response.json()['message']}    Login realizado com sucesso!
    Should Be Empty    ${response.json()['Authorization']}


Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar Login
    ${token_auth}    Set Variable    ${response.json()['Authorization']}
    Log To Console    Token Salvo: ${token_auth}
    Set Global Variable    ${token_auth}

