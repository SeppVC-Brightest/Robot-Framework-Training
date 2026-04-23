*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Test Cases ***
Validate Random Postcode
    Create Session  APIUt  http://postcodes.io
    ${response}=  GET On Session  APIUt  /random/postcodes
    ${response_json}=  Evaluate  json.loads(${response.text})  json
    ${postcode}=  Get From Dictionary  ${response_json}  result
    ${postcode}=  Get From Dictionary  ${postcode}  postcode
    Log  ${postcode}
    
    ${response}=  GET On Session  APIUt  /postcodes/${postcode}/validate
    ${response_json}=  Evaluate  json.loads(${response.text})  json
    ${result}=  Get From Dictionary  ${response_json}  result
    Should Be Equal  ${result}  ${TRUE}

    ${response}=  GET On Session  APIUt  /terminated_postcodes/${postcode}
    Should Be Equal As Numbers  ${response.status_code}  404