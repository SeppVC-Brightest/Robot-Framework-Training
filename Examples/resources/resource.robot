*** Keywords ***
Add two strings
    [Documentation]  This keyword adds two strings together to form one string
    [Arguments]  ${string1}  ${string2}
    ${result}=  Catenate  ${string1}  ${string2}
    RETURN  ${result}


    