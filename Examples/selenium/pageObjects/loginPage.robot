*** Settings ***
Resource  basePage.robot

*** Variables ***
${LOGINPAGE_ENDPOINT}=        /login
${USERNAMETXT}=     id:username
${PASSWORDTXT}=     id:password
${LOGINBTN}=        css:Button
${ERRORMSG}=        css:.flash.error

*** Keywords ***
Go To Loginpage
    ${url}=  Set Variable  ${BASE_URL}${LOGINPAGE_ENDPOINT}
    Go To  ${url}

Login With Username and Password
    [Arguments]  ${username}  ${password}
    Input Text  ${USERNAMETXT}  ${username}
    Input Text  ${PASSWORDTXT}  ${password}
    Click Element  ${LOGINBTN}

Get Error Message
    ${error}=  Get Text  ${ERRORMSG}
    [Return]  ${error}