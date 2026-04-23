*** Settings ***
Resource  basePage.robot

*** Variables ***
${SECURE_ENDPOINT}     /secure
${HEADERTXT}    css:h2
${BODYTXT}      class:subheader
${LOGOUTBTN}    class:button

*** Keywords ***
Get Header
    Wait Until Element Is Visible  ${HEADERTXT}  10s
    ${header}=  Get Text  ${HEADERTXT}
    RETURN  ${header}

Logout
    Click Element  ${LOGOUTBTN}