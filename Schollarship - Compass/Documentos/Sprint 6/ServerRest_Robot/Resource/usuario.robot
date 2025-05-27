*** Settings ***
Library    RequestsLibrary
Resource    ../Tests/dinamics.robot
Resource    ../Tests/common.robot


*** Variables ***



*** Keywords ***

Criar Sessão
    Create Session    ServerRest    https://serverest.com/api

GET /usuarios
    ${response}=    GET On Session    ServerRest    /usuarios
    Set Global Variable    ${response}

Validar o status code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}


Criar Usuario Estatico Valido
    ${json}                Importar JSON Estático    json_usuario.json
    ${payload}             Set Variable    ${json["Usuario_Valido"]}
    Set Global Variable    ${payload}

Cadastrar Usuario Dinamico Valido
    ${payload}             Criar Dados Usuario_Valido
    Set Global Variable    ${payload}
    POST /usuarios