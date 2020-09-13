*** Settings ***
Resource  ../helpers/restClient.robot

*** Keywords ***
Create Postcode Session
    [Arguments]  ${api}=${APIUt}  ${url}=${BASE_URL}
    Create session  ${api}  ${url}