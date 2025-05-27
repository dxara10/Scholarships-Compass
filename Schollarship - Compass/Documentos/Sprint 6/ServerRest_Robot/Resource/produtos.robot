*** Settings ***
Library    RequestsLibrary
Resource    ../Resource/login.robot


*** Variables ***



*** Keywords ***

POST /produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    &{payload}     Create Dictionary    nome=MouseTech    preco=400    descricao=mouse  quantidade=10  
    &{response}    POST On Session    ServerRest    /produtos    json=${payload}    headers={header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE /produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    &{response}    DELETE On Session    ServerRest    /produtos/${id_produto}    headers={header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Validar Ter Criado Produto
    Should Be Equal As Integers    ${response.json()["message"]}    Cadastro realizado com sucesso
    Should Be Empty    ${response.json().["_id"]}


Criar Um Produto e Armazenar ID
    POST /produtos
    Validar Ter Criado Produto
    ${id_produto}    Set Variable    ${response.json()["_id"]}
    Log To Console   ID do Produto: ${id_produto}
    Set Global Variable    ${id_produto}