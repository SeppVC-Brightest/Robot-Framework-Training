*** Settings ***
Resource  ./selenium/helpers/browsermanager.robot

*** Test Cases ***
The First Selenium Test
    Open Browser With WebDriver Manager  https://www.brightest.be  chrome
    Sleep  5s
    Close Browser

