*** Settings ***
Resource  ./baseService.robot

*** Variables ***
${POSTCODES_ENDPOINT}  /postcodes

*** Keywords ***
Validate Postcode
    [Arguments]  ${postcode}  ${api}=${APIUT}
    ${response}=  GET On Session  ${api}  ${POSTCODES_ENDPOINT}/${postcode}/validate
    ${response_json}=  Evaluate  ${response.json()}
    ${result}=  Evaluate  ${response_json}['result']
    ${result}=  Get from list  ${result}  0
    RETURN  ${result}

Get Info On Postcode
    [Arguments]  ${postcode}  ${api}=${APIUt}
    ${response}=  GET On Session  ${api}  ${POSTCODES_ENDPOINT}/${postcode}
    ${response_json}=  Evaluate  ${response.json()}
    ${result}=  Evaluate  ${response_json}['result']
    ${result}=  Get from list  ${result}  0
    RETURN  ${result}

Get Nearest Postcodes On Latitude And Longitude
    [Arguments]  ${latitude}  ${longitude}  ${api}=${APIUt}
    ${response}=  GET On Session  ${api}  ${POSTCODES_ENDPOINT}?lon=${longitude}&lat=${latitude}
    ${response_json}=  Evaluate  ${response.json()}
    ${result}=  Evaluate  ${response_json}['result']
    ${result}=  Get from list  ${result}  0
    RETURN  ${result}