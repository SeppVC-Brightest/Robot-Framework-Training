*** Settings ***
Resource  basePage.robot

*** Variables ***
${FIRSTNAMETXT}    id:first-name
${LASTNAMETXT}     id:last-name
${POSTALCODETXT}   id:postal-code
${CONTINUEBTN}     id:continue

*** Keywords ***
Fill In Your Information
    [Arguments]  ${firstName}  ${lastName}  ${postalCode}
    Wait Until Element Is Visible  ${FIRSTNAMETXT}
    Input Text  ${FIRSTNAMETXT}  ${firstName}
    Input Text  ${LASTNAMETXT}  ${lastName}
    Input Text  ${POSTALCODETXT}  ${postalCode}
    Click Element  ${CONTINUEBTN}