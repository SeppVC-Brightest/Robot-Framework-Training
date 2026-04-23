*** Settings ***
Resource  ../helpers/browsermanager.robot

*** Keywords ***
Open SauceLabs
    [Arguments]  ${url}=${BASE_URL}  ${browser}=${BROWSER}
    Open Browser With WebDriver Manager  ${url}  ${browser}