*** Settings ***
Resource  ./baseService.robot

*** Variables ***
${RANDOM_POSTCODES_ENDPOINT}  /random/postcodes

*** Keywords ***
Get Random Postcode
    [Arguments]  ${api}=${APIUt}
    ${response}=  GET On Session  ${api}  ${RANDOM_POSTCODES_ENDPOINT}
    ${responseBody}=  Evaluate  ${response.json()}
    ${responseBody}=  Evaluate  ${responseBody}['result']
    ${responseBody}=  Get from list  ${responseBody}  0
    RETURN  ${response.status_code}  ${responseBody}

Get Random Postcode As String
    [Arguments]  ${api}=${APIUt}
    ${statusCode}  ${reponseBody}=  Get Random Postcode  ${api}
    ${result}=  Evaluate  ${reponseBody}['postcode']
    ${postcode}=  Get from list  ${result}  0
    RETURN  ${postcode}