*** Test Cases ***
If Condition Is True
    ${boolean}=  Set Variable  ${TRUE}
    IF  ${boolean}
        Log  This boolean is true
    ELSE
        Log  This boolean is false
    END

If Condition Is False
    ${number}=  Set Variable  ${7}
    IF  ${number} != 7
        Log  The number was 7
    END

Multiple Conditions
    ${colour}=  Set Variable  red
    IF  '${colour}'=='red' or '${colour}'=='purple'
        Log  That's a nice colour
    END

Setting Variables With If
    ${boolean}=  Set Variable  ${TRUE}
    IF  ${boolean}
        ${value}=  Set Variable  Variable Value 1
    ELSE
        ${value}=  Set Variable  Variable Value 2
    END
    Log To Console  ${value}