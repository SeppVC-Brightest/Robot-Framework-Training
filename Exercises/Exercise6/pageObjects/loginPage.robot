*** Settings ***
Resource  basePage.robot

*** Variables ***
${USERNAMETXT}    id:user-name
${PASSWORDTXT}    id:password
${LOGINBTN}    id:login-button

*** Keywords ***
Login
    [Arguments]  ${username}  ${password}
    Wait Until Element Is Visible  ${USERNAMETXT}
    Input Text  ${USERNAMETXT}  ${username}
    Input Text  ${PASSWORDTXT}  ${password}
    Click Element  ${LOGINBTN}