*** Settings ***
Resource  basePage.robot

*** Variables ***
${ADDTOCARDBTNS}    css:.btn_inventory
${HOMEHEADER}       css:.app_logo
${SHOPPINGCARTBTN}  css:.shopping_cart_link

*** Keywords ***
Add Random Product To Cart
    Wait Until Element Is Visible  ${HOMEHEADER}  10s
    ${addToCardElements}=    Get WebElements    ${ADDTOCARDBTNS}
    ${count}=    Get Length    ${addToCardElements}
    ${random_index}=    Evaluate    __import__('random').randint(0, ${count}-1)
    Click Element    ${addToCardElements}[${random_index}]

Go To Shopping Cart
    Wait Until Element Is Visible  ${SHOPPINGCARTBTN}  10s
    Click Element  ${SHOPPINGCARTBTN}