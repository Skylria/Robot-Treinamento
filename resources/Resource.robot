*** Settings ***
Library               SeleniumLibrary
Library               String
*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    chrome

*** Keyword ***
### Setup e Teardown
Abrir navegador
    Open Browser        about:blank   ${BROWSER}
    Maximize Browser Window
Fechar navegador
    Close Browser

#### Steps
Acessar a página home do site
    Go To    http://automationpractice.com
    Title Should Be     My Store

Acessar a página de confirmação do pedido
    Go To    http://automationpractice.com/index.php?controller=order

Digitar o nome do produto "${PRODUCT}" no campo de pesquisa
    Input Text       name=search_query   ${PRODUCT}

Clicar no botão pesquisar
    Click Element    name=submit_search

Conferir se o produto "${PRODUCT}" foi listado no site
    Wait Until Element Is Visible     css=#center_column > h1
    Title Should Be                   Search - My Store
    Page Should Contain Image         xpath=//*[@id="center_column"]/ul/li/div/div//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link          xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "${PRODUCT}")]

Conferir se o produto está no carrinho
    Title Should Be                   Order - My Store
    Wait Until Element Is Visible     XPATH=//*[@id="product_1_1_0_0"]/td[1]/a/img
    Page Should Contain Link          xpath=//*[@id="product_1_1_0_0"]/td[2]/p/a

Conferir mensagem de erro "${MESSAGE}"
    Wait Until Element Is Visible     xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be            xpath=//*[@id="center_column"]/p[@class='alert alert-warning']   ${MESSAGE}

Clicar no botão Add to cart
    Mouse Over                        xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
    Click Element                     xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]/span
    Page Should Contain               Product successfully added to your shopping cart

Clicar no botão Proceed to checkout
    Wait Until Element Is Visible     xpath=//*[@id="layer_cart"]/div[1]/div[1]/div[1]/img
    Page Should Contain               There is 1 item in your cart.
    Click Element                     xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span

Criar Conta
    Click Element                     xpath=//*[@id="center_column"]/p[2]/a[1]/span
    Wait Until Element Is Visible     id=email_create
    ${MAIL}                           Generate Random String
    Input Text                        name=email_create             ${MAIL}@teste.com
    Click Element                     xpath=//*[@id="SubmitCreate"]/span
    Click Element                     id=id_gender2
    Input Text                        name=customer_firstname       Teste
    Input Text                        name=customer_lastname        Teste
    Input Text                        name=passwd                   Teste123

Criar Endereço
    Input Text                        id=address1                   Rua Framework, Bairro Robot
    Input Text                        id=city                       Igarassu
    Set Focus To Element              id=id_state
    Select From List By Index         id=id_state                   9
    Input Text                        id=postcode                   12345
    Input Text                        id=phone_mobile               99988877
    Input Text                        id=alias                      My Address
    Click Element                     id=submitAccount
