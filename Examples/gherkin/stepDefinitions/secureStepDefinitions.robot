*** Settings ***
Resource  ../../selenium/pageObjects/securePage.robot

*** Keywords ***
The Secure Area Is Shown
    ${header}=  Run Keyword And Ignore Error  Get Header
    Should Be Equal As Strings  ${header[1]}  Secure Area