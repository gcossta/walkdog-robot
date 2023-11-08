*** Settings ***
Documentation            Suite de testes de cadastro de dog walker

Library                  Browser

**Test Cases ***
Deve poder cadastrar um novo dog walker
    
    # Gabriel Costa
    # gabriel@costa.com
    # 00000014141
    # 78050-000
    # 1000
    # Apto 35

    New Browser         browser=chromium                            headless=False
    New Page            https://walkdog.vercel.app/signup

    Wait For Elements State    form h1           visible            500
    Get Text                   form h1           equal              Faça seu cadastro