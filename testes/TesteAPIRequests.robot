*** Settings ***
Documentation       Exemplo de testes API com o Robot Framework
Resource            ${EXECDIR}/resources/BDDpt-br.robot
Resource            ${EXECDIR}/resources/Resource.robot

*** Test Cases ***
Validar o campo Status Code 200
    Dado que tenha feito a requisição POST na API 4devs
    E tenha obtido o ResponseBody
    Então deve retornar o status code 200
Validar se o campo idade consta no ResponseBody
    Dado que tenha feito a requisição POST na API 4devs
    E tenha obtido o valor do campo idade
    Então deve ser verificado o campo idade no ResponseBody 
Validar se o valor do campo sexo do ResponseBody é igual a Masculino
    Dado que tenha feito a requisição POST na API 4devs
    E tenha obtido o valor do campo sexo
    Então o campo sexo deve ser igual a Masculino
Armazenar o campo CPF do ResponseBody em uma variável
    Dado que tenha feito a requisição POST na API 4devs
    Quando o valor do campo CPF for gravado na variável CPF
    Então deve retornar o valor da variável CPF
Limpar a variável CPF
    Dado que tenha feito a requisição POST na API 4devs
    Quando o valor do campo CPF for gravado na variável CPF
    Então deve retornar o valor da variável CPF vazio