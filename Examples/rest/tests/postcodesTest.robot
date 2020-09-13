*** Settings ***
Resource  ../serviceObjects/postcodes.robot
Resource  ../serviceObjects/randomPostcodes.robot
Resource  ../serviceObjects/terminatedPostcodes.robot

Suite Setup  Create Postcode Session

*** Test Cases ***
Validate Random Postcode
    ${postcode}=  Get Random Postcode As String
    ${isValidated}=  Validate postcode  ${postcode}
    Should Be True  ${isValidated}
    ${isTerminated}=  Is Postcode Terminated  ${postcode}
    Should Not Be True  ${isTerminated}