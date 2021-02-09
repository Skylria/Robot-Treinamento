*** Settings ***
Resource          ../resources/Resource.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    Acessar a página home do site
    Digitar o nome do produto "itemdesconhecido" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found for your search "itemdesconhecido""

Caso de Teste 03: Adicionar produtos ao carrinho
    Acessar a página home do site
    Digitar o nome do produto "t-shirt" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no botão Add to cart
