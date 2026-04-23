*** Test Cases ***
Largest Number Difference
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
    IF  ${number1}<${number2}
        ${smallest}=  Set Variable  ${number1}
    ELSE
        ${smallest}=  Set Variable  ${number2}
    END
    IF  ${number3}<${largest}
        ${smallest}=  Set Variable  ${number3}
    ELSE
        ${smallest}=  Set Variable  ${largest}
    END
    Log To Console  largest ${largest}, smallest ${smallest}, difference ${largest-${smallest}}