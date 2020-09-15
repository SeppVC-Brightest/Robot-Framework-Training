*** Settings ***
Resource  ./baseService.robot

*** Variables ***
${TERMINATED_POSTCODES_ENDPOINT}=  /terminated_postcodes

*** Keywords ***
Lookup Terminated Postcode
    [Arguments]  ${postcode}  ${api}=${APIUt}
    ${response}=  Get request  ${api}  ${TERMINATED_POSTCODES_ENDPOINT}/${postcode}
    ${responseBody}=  To Json  ${response.text}
    ${responseResult}=  Get value from json  ${responseBody}  $.result
    ${responseError}=  Get value from json  ${responseBody}  $.error
    ${responseResult}=  Run Keyword And Ignore Error  Get from list  ${responseResult}  0
    ${responseError}=  Run Keyword And Ignore Error  Get from list  ${responseError}  0
    [Return]  ${response.status_code}  ${responseResult[1]}  ${responseError[1]}

Is Postcode Terminated
    [Arguments]  ${postcode}  ${api}=${APIUt}
    ${statuscode}  ${result}  ${error}=  Lookup Terminated Postcode    ${postcode}    ${api}
    ${isTerminated}=  Run Keyword If  '${error}'=='Terminated postcode not found'  Set Variable  ${FALSE}  ELSE  Set Variable  ${TRUE}
    [Return]  ${isTerminated}