*** Keywords ***
One Argument With Default Value
    [Arguments]  ${arg}=default value
    [Documentation]  This keyword takes 0-1 arguments
    Log  Got argument ${arg}

One Required And One With Default
    [Arguments]  ${required}  ${optional}=default
    [Documentation]  This keyword takes 1-2 arguments
    Log  Required: ${required}
    Log  Optional: ${optional}

Single Return Keyword
    [Documentation]  This keyword returns 1 value
    [Return]  Return value

Multiple Return Keyword
    [Documentation]  This keyword returns 2 values
    [Return]  value1  ${2}