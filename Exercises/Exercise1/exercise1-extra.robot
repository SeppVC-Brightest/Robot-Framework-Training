*** Test Cases ***
Largest Number 3 Variables
    ${number1}=  Set Variable  ${12}
    ${number2}=  Set Variable  ${3}
    ${number3}=  Set Variable  ${9}
    ${largest}=  Run Keyword If  ${number1}>${number2}  Set Variable  ${number1}  ELSE  Set Variable  ${number2}
    ${largest}=  Run Keyword If  ${number3}>${largest}  Set Variable  ${number3}  ELSE  Set Variable  ${largest}
    Log To Console  ${largest}