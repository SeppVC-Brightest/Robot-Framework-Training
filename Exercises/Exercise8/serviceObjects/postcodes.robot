*** Settings ***
Resource  ./baseService.robot

*** Variables ***
${POSTCODES_ENDPOINT}=  /postcodes

*** Keywords ***
Validate Postcode
    [Arguments]  ${postcode}  ${api}=${APIUT}
    ${response}=  Get request  ${api}  ${POSTCODES_ENDPOINT}/${postcode}/validate
    ${response}=  To Json  ${response.text}
    ${result}=  Get value from json  ${response}  $.result
    ${result}=  Get from list  ${result}  0
    [Return]  ${result}

Get Info On Postcode
    [Arguments]  ${postcode}  ${api}=${APIUt}
    ${response}=  Get request  ${api}  ${POSTCODES_ENDPOINT}/${postcode}
    ${response}=  To Json  ${response.text}
    ${result}=  Get value from json  ${response}  $.result
    ${result}=  Get from list  ${result}  0
    [Return]  ${result}

Get Nearest Postcodes On Latitude And Longitude
    [Arguments]  ${latitude}  ${longitude}  ${api}=${APIUt}
    ${response}=  Get request  ${api}  ${POSTCODES_ENDPOINT}?lon=${longitude}&lat=${latitude}
    ${response}=  To Json  ${response.text}
    ${result}=  Get value from json  ${response}  $.result
    ${result}=  Get from list  ${result}  0
    [Return]  ${result}