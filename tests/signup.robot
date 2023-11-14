*** Settings ***
Documentation            Suite de testes de cadastro de dog walker

Resource                 ../resources/base.resource

Test Setup               Start session
Test Teardown            Finish session

**Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]             smoke
    
    ${dog_walker}      Create Dictionary
    ...    name=Gabriel Costa
    ...    email=gabriel@costa.com
    ...    cpf=00000014141
    ...    cep=78050-000
    ...    street=Avenida Historiador Rubens de Mendonça
    ...    district=Bosque da Saúde
    ...    city_uf=Cuiabá/MT
    ...    number=1000
    ...    details=Apto 35
    ...    cnh=toretto.jpg
            
    Go to signup page
    Fill signup form   ${dog_walker}
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required

    Go to signup page
    Submit signup form

    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)

Não deve cadastrar se o cpf for incorreto
    [Tags]             cpf_inv

    ${dog_walker}      Create Dictionary
    ...    name=Gabriel Costa
    ...    email=gabriel@costa.com
    ...    cpf=000000141aa
    ...    cep=78050-000
    ...    street=Avenida Historiador Rubens de Mendonça
    ...    district=Bosque da Saúde
    ...    city_uf=Cuiabá/MT
    ...    number=1000
    ...    details=Apto 35
    ...    cnh=toretto.jpg
            
    Go to signup page
    Fill signup form       ${dog_walker}
    Submit signup form
    Alert should be        CPF inválido

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]             aservice
    
    ${dog_walker}      Create Dictionary
    ...    name=Gabriel Costa
    ...    email=gabriel@costa.com
    ...    cpf=00000014141
    ...    cep=78050-000
    ...    street=Avenida Historiador Rubens de Mendonça
    ...    district=Bosque da Saúde
    ...    city_uf=Cuiabá/MT
    ...    number=1000
    ...    details=Apto 35
    ...    cnh=toretto.jpg
    ...    additional_service=Cuidar
            
    Go to signup page
    Fill signup form   ${dog_walker}
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walker que sabe adestrar pets
    [Tags]             aservice
    
    ${dog_walker}      Create Dictionary
    ...    name=Gabriel Costa
    ...    email=gabriel@costa.com
    ...    cpf=00000014141
    ...    cep=78050-000
    ...    street=Avenida Historiador Rubens de Mendonça
    ...    district=Bosque da Saúde
    ...    city_uf=Cuiabá/MT
    ...    number=1000
    ...    details=Apto 35
    ...    cnh=toretto.jpg
    ...    additional_service=Adestrar
            
    Go to signup page
    Fill signup form   ${dog_walker}
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.