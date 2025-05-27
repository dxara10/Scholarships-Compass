*** Settings ***
Documentation     Common test suite for all tests
Library           FakerLibrary



*** Keywords ***
Criar Dados Usuario_Valido
    ${nome}    FakerLibrary.Name
    ${email}   FakerLibrary.Email
    ${senha}   FakerLibrary.Password
    ${payload}    Create Dictionary    
    ...    nome=${nome}    
    ...    email=${email}    
    ...    password=${senha}
    ...    admin=True
    Log To Console    Payload: ${payload}
    [Return]    ${payload}
    Set Global Variable    ${payload}