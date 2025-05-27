*** Settings ***
Documentation     Testes de API para o recurso de Usuários
Library           RequestsLibrary
Resource          ../Resource/login.robot
Resource          ../Resource/usuario.robot


*** Variables ***


*** Test Cases ***
GET Listar Usuarios
    Criar Sessão
    GET /usuarios
    Validar o status code "200"
    

GET Listar Usuario especifico id K6leHdftCeOJj8BJ
    Ter um usuario Cadastrado
    A requisição deve retornar o status code 200
    email e senha

POST Cadastrar Usuario Dinamico
    Criar Usuario Dinamico
    POST Usuario Dinamico no Endpoint /usuarios
    Validar o status code 201
    Validar "Cadastrado com sucesso"

POST Cadastrar Usuario Invalido
    Dados Invalidos
    A requisição deve retornar o status code 400
    email e senha invalido

POST Cadastrar Usuario Existente
    Dados Validos
    Ter um usuario Cadastrado
    A requisição deve retornar o status code 409
    email e senha ja cadastrados

PUT Atualizar Usuario com id K6leHdftCeOJj8BJ
    Dados Validos
    Ter um usuario Cadastrado
    vALIDAR status code 200
    email e senha atualizados

DELETE Deletar Usuario com id K6leHdftCeOJj8BJ
    Ter um usuario Cadastrado
    o usuario não deve ter carrinho cadastrado
    A requisição deve retornar o status code 200
    email e senha deletados



*** Keywords ***