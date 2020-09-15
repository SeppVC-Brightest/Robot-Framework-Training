*** Settings ***
Resource  ./baseService.robot

*** Variables ***
${RANDOM_POSTCODES_ENDPOINT}=  /random/postcodes

*** Keywords ***
Get Random Postcode
    [Arguments]  ${api}=${APIUt}
    ${response}=  Get Request  ${api}  ${RANDOM_POSTCODES_ENDPOINT}
    ${responseBody}=  To Json  ${response.text}
    ${responseBody}=  Get value from json  ${responseBody}  $.result
    ${responseBody}=  Get from list  ${responseBody}  0
    [Return]  ${response.status_code}  ${responseBody}

Get Random Postcode As String
    [Arguments]  ${api}=${APIUt}
    ${statusCode}  ${reponseBody}=  Get Random Postcode  ${api}
    ${result}=  Get value from json  ${reponseBody}  $.postcode
    ${postcode}=  Get from list  ${result}  0
    [Return]  ${postcode}