*** Settings ***
Resource  basePage.robot

*** Variables ***
${FINISHBTN}    id:finish

*** Keywords ***
Finish Checkout
    Wait Until Element Is Visible  ${FINISHBTN}
    Click Element  ${FINISHBTN}