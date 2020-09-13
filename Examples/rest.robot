*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Test Cases ***
Validate Random Postcode
    Create session  APIUt  http://postcodes.io
    ${response}=  Get Request  APIUt  /random/postcodes
    ${response}=  To Json  ${response.text}
    ${result}=  Get Value From Json  ${response}  $.result.postcode
    Log  ${result}
    ${postcode}=  Get From List  ${result}  0
    
    ${response}=  Get Request  APIUt  /postcodes/${postcode}/validate
    ${response}=  To Json  ${response.text}
    ${result}=  Get Value From Json  ${response}  $.result
    ${result}=  Get From List  ${result}  0
    Should Be Equal  ${result}  ${TRUE}

    ${response}=  Get Request  APIUt  /terminated_postcodes/${postcode}
    Should Be Equal As Numbers  ${response.status_code}  404