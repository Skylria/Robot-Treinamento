*** Settings ***
Library               SeleniumLibrary
*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    chrome

*** Keyword ***
### Setup e Teardown
Abrir navegador
    Open Browser        about:blank   ${BROWSER}

Fechar navegador
    Close Browser

#### Steps
Acessar a página home do site
    Go To    http://automationpractice.com
    Title Should Be     My Store

Digitar o nome do produto "${PRODUCT}" no campo de pesquisa
    Input Text       name=search_query   ${PRODUCT}

Clicar no botão pesquisar
    Click Element    name=submit_search

Conferir se o produto "${PRODUCT}" foi listado no site
    Wait Until Element Is Visible     css=#center_column > h1
    Title Should Be                   Search - My Store
    Page Should Contain Image         xpath=//*[@id="center_column"]/ul/li/div/div//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link          xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "${PRODUCT}")]

Conferir mensagem de erro "${MESSAGE}"
    Wait Until Element Is Visible     xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be            xpath=//*[@id="center_column"]/p[@class='alert alert-warning']   ${MESSAGE}
