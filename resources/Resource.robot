*** Settings ***

Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${URL_API}      https://www.4devs.com.br/
&{body}         acao=gerar_pessoa       pontuacao=N     sexo=H      txt_qtde=1

*** Keywords ***
### DADO ###
que tenha feito a requisição POST na API 4devs
    Create Session      API4DEVS      ${URL_API}
### E ###        
tenha obtido o ResponseBody
    ${RESPOSTA}=    POST On Session    API4DEVS    ferramentas_online.php     data=${body}
    Log     ${RESPOSTA}
    Set Global Variable      ${RESPOSTA}
### ENTÃO ###   
deve retornar o status code 200      
    ${code}=    Convert To String    ${RESPOSTA.status_code}
    Should Be Equal     ${code}     200
    Log                 ${code} 
### E ###    
tenha obtido o valor do campo idade
    ${idade}=    Convert To String    ${RESPOSTA.json()[0]["idade"]}
    Set Global Variable     ${idade}
### ENTÃO ###   
deve ser verificado o campo idade no ResponseBody
    Dictionary Should Contain Key       ${RESPOSTA.json()[0]}       idade
### E ###    
tenha obtido o valor do campo sexo
    ${sexo}=    Convert To String    ${RESPOSTA.json()[0]["sexo"]}
    Log      ${sexo}
    Set Global Variable     ${sexo}
### ENTÃO ###   
o campo sexo deve ser igual a Masculino
    Should Be Equal As Strings      ${sexo}    Masculino
### QUANDO ###    
o valor do campo CPF for gravado na variável CPF
    ${cpf}=    Convert To String    ${RESPOSTA.json()[0]["cpf"]}
    Log                     ${cpf}
    Set Global Variable     ${cpf}
### ENTÃO ###   
deve retornar o valor da variável CPF 
    Log     ${cpf}
### ENTÃO ###
deve retornar o valor da variável CPF vazio
    ${cpf}=     Replace Variables       ${EMPTY}  
    Log     ${cpf}
