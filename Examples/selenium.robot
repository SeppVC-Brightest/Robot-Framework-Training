*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
The First Selenium Test
    Open Browser  https://www.brightest.be  Google Chrome
    Sleep  5s
    Close Browser

