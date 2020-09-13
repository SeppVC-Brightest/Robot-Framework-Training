*** Variables ***
${GLOBALVARIABLE}=  Hello World!

*** Test Cases ***
Assigning Variables
    ${number}=  Set Variable  ${3}
    ${string}=  Set Variable  String
    ${boolean}=  Set Variable  ${TRUE}
    ${empty}=  Set Variable  ${EMPTY}

Using Lists
    @{list}=  Create List  1  2  3

Using Dictionaries
    &{dictionary}=  Create Dictionary  first=1  second=${2}  ${3}=third