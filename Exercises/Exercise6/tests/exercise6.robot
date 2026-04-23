*** Settings ***
Resource  ../pageObjects/loginPage.robot
Resource  ../pageObjects/homePage.robot
Resource  ../pageObjects/shoppingCartPage.robot
Resource  ../pageObjects/yourInformationPage.robot
Resource  ../pageObjects/overviewPage.robot
Resource  ../pageObjects/checkoutCompletePage.robot

Suite Setup  Open SauceLabs
Suite Teardown  Close browser

*** Test Cases ***
Add product to cart and checkout
    Login  standard_user  secret_sauce
    Add Random Product To Cart
    Go To Shopping Cart
    Checkout
    Fill In Your Information  John  Doe  12345
    Finish Checkout
    ${title}=  Get Checkout Complete Title
    Should Be Equal  ${title}  Thank you for your order!