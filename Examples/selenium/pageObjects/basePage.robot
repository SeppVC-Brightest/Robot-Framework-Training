*** Settings ***
Resource  ../helpers/browser.robot

*** Keywords ***
Open The Internet
    [Arguments]  ${url}=${BASE_URL}  ${browser}=${BROWSER}
    Open Browser  ${url}  ${browser}