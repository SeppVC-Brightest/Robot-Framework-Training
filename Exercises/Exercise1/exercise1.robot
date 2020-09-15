*** Test Cases ***
Largest Number 2 Variables
    ${number1}=  Set Variable  ${1}
    ${number2}=  Set Variable  ${3}
    Run Keyword If  ${number1}>${number2}  Log To Console  ${number1}  ELSE  Log To Console  ${number2}
    