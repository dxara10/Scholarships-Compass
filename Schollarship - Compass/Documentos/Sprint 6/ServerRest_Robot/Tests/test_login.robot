*** Settings ***
Documentation    Arquivo de requisições do sistema
Library    RequestsLibrary
Resource    ../Resource/login.robot
Resource    ../Resource/usuario.robot



*** Variables ***


*** Test Cases ***
POST Fazer Login
    Criar Sessão
    POST Endpoint /login
    #Validar status code 200


#DELETE Deletar Usuario com id K6leHdftCeOJj8BJ
    #Ter um usuario Cadastrado
    #o usuario não deve ter carrinho cadastrado
    #A requisição deve retornar o status code 200
    #email e senha deletados




*** Keywords ***