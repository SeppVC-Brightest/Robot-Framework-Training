*** Settings ***
Resource  basePage.robot

*** Variables ***
${CHECKOUTBTN}    id:checkout

*** Keywords ***
Checkout
    Wait Until Element Is Visible  ${CHECKOUTBTN}
    Click Element  ${CHECKOUTBTN}