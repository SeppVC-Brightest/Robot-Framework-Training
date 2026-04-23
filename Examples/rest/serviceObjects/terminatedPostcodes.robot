*** Settings ***
Resource  ./baseService.robot

*** Variables ***
${TERMINATED_POSTCODES_ENDPOINT}  /terminated_postcodes

*** Keywords ***
Lookup Terminated Postcode
    [Arguments]  ${postcode}  ${api}=${APIUt}
    ${response}=  GET On Session  ${api}  ${TERMINATED_POSTCODES_ENDPOINT}/${postcode}
    ${responseBody}=  Evaluate  ${response.json()}
    ${responseResult}=  Evaluate  ${responseBody}.get('result')
    ${responseError}=  Evaluate  ${responseBody}.get('error')
    ${responseResult}=  Run Keyword And Ignore Error  Get from list  ${responseResult}  0
    ${responseError}=  Run Keyword And Ignore Error  Get from list  ${responseError}  0
    RETURN  ${response.status_code}  ${responseResult[1]}  ${responseError[1]}

Is Postcode Terminated
    [Arguments]  ${postcode}  ${api}=${APIUt}
    ${statuscode}  ${result}  ${error}=  Lookup Terminated Postcode    ${postcode}    ${api}
    IF  '${error}'=='Terminated postcode not found'
        ${isTerminated}=  Set Variable  ${FALSE}
    ELSE
        ${isTerminated}=  Set Variable  ${TRUE}
    END
    RETURN  ${isTerminated}