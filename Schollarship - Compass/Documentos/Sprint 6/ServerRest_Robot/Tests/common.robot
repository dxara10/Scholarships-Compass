*** Settings ***
Documentation
Library    OperatingSystem
Library    RequestsLibrary


*** Keywords ***
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}


Importar JSON Estático
    [Arguments]    ${nome do arquivo.json}
    ${InstanciaDoArquivo} =    Get File    ${EXECDIR}/${nome do arquivo.json}
    ${data}    Evaluate    json.loads('''${InstanciaDoArquivo}''')    json
    [Return]    ${data}