*** Settings ***
Resource  ../helpers/browser.robot

*** Keywords ***
Open My Store
    [Arguments]  ${url}=${BASE_URL}  ${browser}=${BROWSER}
    Open Browser  ${url}  ${browser}