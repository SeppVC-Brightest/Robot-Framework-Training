*** Settings ***
Resource  ./resources/resource.robot

*** Variables ***
${MESSAGE}=  Hello World!

*** Keywords ***
Multiply numbers
    [Documentation]  This keywork multiplies 2 numbers, logs and returns the result
    [Arguments]  ${number1}  ${number2}
    ${result}=  Evaluate  ${number1} * ${number2}
    Log  ${result}
    [Return]  ${result}

*** Test Cases ***
Test case 1
    [Tags]  Sanity
    ${result}=  Multiply numbers    ${4}    ${9}
    Log  ${result}
    # This line is a comment
    ${result}=  Add two strings  Robot  Framework
    Log  ${result}