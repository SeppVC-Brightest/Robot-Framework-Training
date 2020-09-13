*** Test Cases ***
If Condition Is True
    ${boolean}=  Set Variable  ${TRUE}
    Run Keyword If  ${boolean}  Log  This boolean is true  ELSE  Log  This boolean is false

If Condition Is False
    ${number}=  Set Variable  ${7}
    Run Keyword Unless  ${number}==7  Log  The number was 7

Multiple Conditions
    ${colour}=  Set Variable  red
    Run Keyword If  '${colour}'=='red' or '${colour}'=='purple'  Log  That's a nice colour

Setting Variables With If
    ${boolean}=  Set Variable  ${TRUE}
    ${value}=  Run Keyword If  ${boolean}  Set Variable  Variable Value 1  ELSE  Set Variable  Variable Value 2
    Log To Console  ${value}