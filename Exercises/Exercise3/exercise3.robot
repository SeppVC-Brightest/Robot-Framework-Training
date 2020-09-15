*** Test Cases ***
Divisible By
    Log To Console  Divisible by 3:
    FOR  ${number}  IN RANGE  100
        ${remainder}=  Evaluate  ${number}%3
        Run Keyword If  ${remainder}==0  Log To Console  ${number}
    END

    Log To Console  Divisible by 5:
    FOR  ${number}  IN RANGE  100
        ${remainder}=  Evaluate  ${number}%5
        Run Keyword If  ${remainder}==0  Log To Console  ${number}
    END

    Log To Console  Divisible by 5:
    FOR  ${number}  IN RANGE  100
        ${remainder3}=  Evaluate  ${number}%3
        ${remainder5}=  Evaluate  ${number}%5
        Run Keyword If  ${remainder}==0 and ${remainder5}==0  Log To Console  ${number}
    END