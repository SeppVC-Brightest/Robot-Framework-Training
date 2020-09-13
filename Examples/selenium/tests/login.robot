*** Settings ***
Resource  ../pageObjects/loginPage.robot
Resource  ../pageObjects/securePage.robot

Suite Setup  Run Keywords  Open The Internet  Go To Loginpage
Suite Teardown  Close browser

*** Test Cases ***
Correct login
    Login With Username and Password  ${USERNAME}  ${PASSWORD}
    ${header}=  Get Header
    Logout
    Should Contain  Secure Area  ${header}

Incorrect Username
    Login With Username and Password  tom  ${PASSWORD}
    ${error}=  Get Error Message
    Should Contain  ${error}  Your username is invalid!

Incorrect Password
    Login With Username and Password  ${USERNAME}  incorrectPassword
    ${error}=  Get Error Message
    Should Contain  ${error}  Your password is invalid!