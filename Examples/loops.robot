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
        IF  '${var}'=='two'
            BREAK
        END
        ${text}=  Set Variable    ${text}${var}
    END
    Log  ${text}

Continue For Loop
    ${text}=  Set Variable  ${EMPTY}
    FOR  ${var}  IN  one  two  three
        IF  '${var}' == 'two'
            CONTINUE
        END
        ${text}=  Set Variable  ${text}${var}
    END
    Log  ${text}

Nested FOR Loops
    FOR  ${i}  IN RANGE  3
        FOR  ${j}  IN RANGE  2
            Log  i=${i}, j=${j}
        END
    END