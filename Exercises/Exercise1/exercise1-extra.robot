*** Test Cases ***
Largest Number 3 Variables
    ${number1}=  Set Variable  ${12}
    ${number2}=  Set Variable  ${3}
    ${number3}=  Set Variable  ${9}
    IF  ${number1}>${number2}
        ${largest}=  Set Variable  ${number1}
    ELSE
        ${largest}=  Set Variable  ${number2}
    END
    IF  ${number3}>${largest}
        ${largest}=  Set Variable  ${number3}
    ELSE
        ${largest}=  Set Variable  ${largest}
    END
    Log To Console  ${largest}