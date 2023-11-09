*** Settings ***
Documentation            Suite de testes de cadastro de dog walker

Library                  Browser

**Test Cases ***
Deve poder cadastrar um novo dog walker
    
    ${name}            Set Variable                                 Gabriel Costa
    ${email}           Set Variable                                 gabriel@costa.com
    ${cpf}             Set Variable                                 00000014141
    ${cep}             Set Variable                                 78050-000
    ${addressStreet}   Set Variable                                 Avenida Historiador Rubens de Mendonça
    ${addressDistrict}   Set Variable                               Bosque da Saúde
    ${addressCityUf}   Set Variable                                 Cuiabá/MT
    ${addressNumber}   Set Variable                                 1000
    ${addressDetails}  Set Variable                                 Apto 35

    New Browser         browser=chromium                            headless=False
    New Page            https://walkdog.vercel.app/signup

    Wait For Elements State    form h1           visible            500
    Get Text                   form h1           equal              Faça seu cadastro

    Fill Text           css=input[name=name]                        ${name}
    Fill Text           css=input[name=email]                       ${email}
    Fill Text           css=input[name=cpf]                         ${cpf}
    Fill Text           css=input[name=cep]                         ${cep}

    Click               css=input[type=button][value$=CEP]

    Get Property        css=input[name=addressStreet]  value  equal    ${addressStreet}
    Get Property        css=input[name=addressDistrict]  value  equal  ${addressDistrict}   
    Get Property        css=input[name=addressCityUf]  value  equal    ${addressCityUf}   

    Fill Text           css=input[name=addressNumber]               ${addressNumber}
    Fill Text           css=input[name=addressDetails]              ${addressDetails}

    Upload File By Selector      css=input[type=file]               ${EXECDIR}/toretto.jpg

    Sleep               20