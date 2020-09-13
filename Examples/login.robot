*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Incorrect password
    Open Browser  https://the-internet.herokuapp.com/login  Google Chrome
    Input Text  id:username  tomsmith
    Input Text  id:password  incorrectPassword
    Click Element  css:Button
    ${errorMessage}=  Get Text  css:.flash.error
    Should Contain  ${errorMessage}  Your password is invalid!
    Close Browser

Incorrect username
    Open Browser  https://the-internet.herokuapp.com/login  Google Chrome
    Input Text  id:username  tom
    Input Text  id:password  incorrectPassword
    Click Element  css:Button
    ${errorMessage}=  Get Text  css:.flash.error
    Should Contain  ${errorMessage}  Your username is invalid!
    Close Browser