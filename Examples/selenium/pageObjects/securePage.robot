*** Settings ***
Resource  basePage.robot

*** Variables ***
${SECURE_ENDPOINT}=        /secure
${HEADERTXT}=       css:h2
${BODYTXT}=         class:subheader
${LOGOUTBTN}=       class:button

*** Keywords ***
Get Header
    ${header}=  Get Text  ${HEADERTXT}
    [Return]  ${header}

Logout
    Click Element  ${LOGOUTBTN}