*** Settings ***
Library  DateTime

*** Keywords ***
Should Be Greater Than
    [Arguments]  ${date1}  ${date2}
    IF  '${date1}'<='${date2}'
        Fail  The first date was earlier than or equal to the second date
    END

*** Test Cases ***
Time Difference
    ${currentTimestamp}=  Get Time
    Sleep  5s
    ${currentTimestamp2}=  Get Time
    Should Be Greater Than  ${currentTimestamp2}  ${currentTimestamp}
    ${difference}=  Subtract Date From Date  ${currentTimestamp2}  ${currentTimestamp}  verbose
    Log To Console  Time difference: ${difference}