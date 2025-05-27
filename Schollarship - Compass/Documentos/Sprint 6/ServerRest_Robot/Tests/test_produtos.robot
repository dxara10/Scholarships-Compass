*** Settings ***
Library    RequestsLibrary
Resource    ../Resource/produtos.robot
Resource    ../Resource/login.robot
Resource    ../Resource/usuario.robot


*** Variables ***


*** Test Cases ***
POST Cadastrar Produto 
    Criar Sessão
    Fazer Login e Armazenar Token
    POST /produtos
    #Validar o status code 201

#DELETE Excluir Produto
 #   Criar Sessão
  #  Fazer Login e Armazenar Token
   # Criar Produto e Armazenar ID
    #DELETE /produtos
    #Validar status code



*** Keywords ***
