*** Settings ***
Resource  ./baseService.robot

*** Variables ***
${POSTCODES_ENDPOINT}  /postcodes

*** Keywords ***
Validate Postcode
    [Arguments]  ${postcode}  ${api}=${APIUt}
    ${response}=  GET On Session  ${api}  ${POSTCODES_ENDPOINT}/${postcode}/validate
    ${response_json}=  Evaluate  ${response.json()}
    ${result}=  Evaluate  ${response_json}['result']
    ${result}=  Get from list  ${result}  0
    RETURN  ${result}