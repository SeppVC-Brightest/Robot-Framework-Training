*** Settings ***
Resource  ../serviceObjects/postcodes.robot
Resource  ../serviceObjects/randomPostcodes.robot
Resource  ../serviceObjects/terminatedPostcodes.robot
Library  Collections

Suite Setup  Create Postcode Session

*** Test Cases ***
Find Postcode Based On Latitude And Longitude
    ${postcode}=  Get Random Postcode As String
    ${info}=  Get Info On Postcode  ${postcode}
    ${longitude}=  Get From Dictionary  ${info}  longitude
    ${latitude}=  Get From Dictionary  ${info}  latitude
    @{postcodesList}=  Get Nearest Postcodes On Latitude And Longitude    ${latitude}    ${longitude}
    FOR  ${postcode}  IN  @{postcodesList}
        ${postcodeAsString}=  Get From Dictionary  ${postcode}  postcode
        Log To Console  ${postcodeAsString}
    END