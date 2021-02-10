*** Settings ***
Resource              ../resources/resource.robot
### SETUP
Test Setup           Abrir Navegador
###TEARDOWN
# Test Teardown        Fechar Navegador

*** Test Case ***
Cenário 01: Pesquisar produto existente
    Dado que foi exibida a página home do site
    Quando pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca

Cenário 02: Pesquisar produto não existente
    Dado que foi exibida a página home do site
    Quando pesquisar pelo produto "itemdesconhecido"
    Então a página deve exibir a mensagem "No results were found for your search "itemdesconhecido""

Cenário 03: Adicionar Produtos ao carrinho e finalizar compra
    Dado que foi exibida a página home do site
    Quando pesquisar pelo produto "t-shirt"
    E clicar no botão Add to cart
    E clicar no botão Proceed to checkout
    E efetuar o preenchimento das informações necessárias

    # Então a página deve exi
*** Keywords ***
Dado que foi exibida a página home do site
    Acessar a página home do site

Dado que foi exibida a página de confirmação do pedido
    Acessar a página de confirmação do pedido

Quando pesquisar pelo produto "${PRODUCT}"
    Digitar o nome do produto "${PRODUCT}" no campo de pesquisa
    Clicar no botão pesquisar

E clicar no botão Add to cart
    Clicar no botão Add to cart

E clicar no botão Proceed to checkout
    Clicar no botão Proceed to Checkout

E efetuar o preenchimento das informações necessárias
    Criar Conta
    Criar Endereço

Então o produto "${PRODUCT}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUCT}" foi listado no site

Então a página deve exibir os produtos adicionados
    Conferir se o produto está no carrinho

Então a página deve exibir a mensagem "${MESSAGE}"
    Conferir mensagem de erro "${MESSAGE}"
