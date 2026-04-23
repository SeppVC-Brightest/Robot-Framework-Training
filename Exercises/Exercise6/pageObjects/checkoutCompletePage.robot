*** Settings ***
Resource  basePage.robot

*** Variables ***
${TITLELBL}    css:.complete-header

*** Keywords ***
Get Checkout Complete Title
    Wait Until Element Is Visible  ${TITLELBL}
    ${title}=  Get Text  ${TITLELBL}
    RETURN  ${title}