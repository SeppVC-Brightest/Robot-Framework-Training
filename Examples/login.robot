*** Settings ***
Resource  ./selenium/helpers/browsermanager.robot

*** Test Cases ***
Incorrect password
    Open Browser With WebDriver Manager  https://the-internet.herokuapp.com/login  chrome
    Input Text  id:username  tomsmith
    Input Text  id:password  incorrectPassword
    Click Element  css:Button
    ${errorMessage}=  Get Text  css:.flash
    Should Contain  ${errorMessage}  Your password is invalid!
    Close Browser

Incorrect username
    Open Browser With WebDriver Manager  https://the-internet.herokuapp.com/login  chrome
    Input Text  id:username  tom
    Input Text  id:password  incorrectPassword
    Click Element  css:Button
    ${errorMessage}=  Get Text  css:.flash
    Should Contain  ${errorMessage}  Your username is invalid!
    Close Browser


    