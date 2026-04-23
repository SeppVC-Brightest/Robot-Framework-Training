*** Settings ***
Resource  basePage.robot

*** Variables ***
${LOGINPAGE_ENDPOINT}      /login
${USERNAMETXT}  id:username
${PASSWORDTXT}  id:password
${LOGINBTN}     css:button
${ERRORMSG}     css:.flash

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
    Wait Until Element Is Visible  ${ERRORMSG}  10s
    ${error}=  Get Text  ${ERRORMSG}
    RETURN  ${error}