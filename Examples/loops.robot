*** Keywords ***
Nested For
    [Documentation]  Keyword which contains a for loop used in a nested for loop
    [Arguments]  ${list}
    Log  Logging items in list:
    FOR  ${item}  IN  @{list}
        Log  ${item}
    END

*** Test Cases ***
Only upper limit
    [Documentation]  Loops over values from 0 to 9
    FOR  ${index}  IN RANGE  10
        Log  ${index}
    END

Start and end
    [Documentation]  Loops over values from 1 to 10
    FOR  ${index}  IN RANGE  1  11
        Log  ${index}
    END

Also step given
    [Documentation]  Loops over values 5, 15, and 25
    FOR  ${index}  IN RANGE  5  26  10
        Log  ${index}
    END

Arithmetic
    [Documentation]  Arithmetic with variable
    ${var}=  Set Variable  ${2}
    FOR  ${index}  IN RANGE  ${var} + 1
        Log  ${index}
    END


Looping Over Lists
    @{list}=  Create List  1  2  3
    FOR  ${entry}  IN  @{list}
        Log  ${entry}
    END

Looping Over Dictionaries
    &{dictionary}=  Create Dictionary  first=1  second=${2}  ${3}=third
    FOR  ${key}  ${value}  IN  &{dictionary}
        Log  ${key}
        Log  ${value}
    END

Exiting For Loops
    ${text}=  Set Variable  ${EMPTY}
    FOR  ${var}  IN  one  two
        Run Keyword If  '${var}'=='two'  Exit For Loop
        ${text}=  Set Variable    ${text}${var}
    END
    Log  ${text}

Continue For Loop
    ${text}=  Set Variable  ${EMPTY}
    FOR  ${var}  IN  one  two  three
        Continue For Loop If  '${var}' == 'two'
        ${text}=  Set Variable  ${text}${var}
    END
    Log  ${text}

Nested For Loop
    [Documentation]  For loops cannot be nested with Robot Framework, instead a new keyword needs to be defined
    ${list1}=  Create list  String1-1  String1-2  String1-3  String1-4
    ${list2}=  Create list  String2-1  String2-2  String2-3  String2-4
    ${list3}=  Create list  String3-1  String3-2  String3-3  String3-4
    ${list4}=  Create list  ${list1}  ${list2}  ${list3}

    FOR  ${item}  IN  @{list4}
        Log  Logging list
        Log  ${item}
        Nested for  ${item}
    END