*** Settings ***
Documentation            Suite de testes de cadastro de dog walker

Resource                 ../resources/base.resource

**Test Cases ***
Deve poder cadastrar um novo dog walker
    
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
            

    Start session
    Go to signup page
    Fill signup form   ${dog_walker}
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.
    Finish session