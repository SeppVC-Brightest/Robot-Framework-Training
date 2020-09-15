*** Settings ***
Resource  ../serviceObjects/postcodes.robot
Resource  ../serviceObjects/randomPostcodes.robot
Resource  ../serviceObjects/terminatedPostcodes.robot

Suite Setup  Create Postcode Session

*** Test Cases ***
Find Postcode Based On Latitude And Longitude
    ${postcode}=  Get Random Postcode As String
    ${info}=  Get Info On Postcode  ${postcode}
    ${longitude}=  Get value from json  ${info}  $.longitude
    ${longitude}=  Get from list  ${longitude}  0
    ${latitude}=  Get value from json  ${info}  $.latitude
    ${latitude}=  Get from list  ${latitude}  0
    @{postcodesList}=  Get Nearest Postcodes On Latitude And Longitude    ${latitude}    ${longitude}
    FOR  ${postcode}  IN  @{postcodesList}
        ${postcodeAsString}=  Get value from json  ${postcode}  $.postcode
        ${postcodeAsString}=  Get from list  ${postcodeAsString}  0
        Log To Console  ${postcodeAsString}
    END