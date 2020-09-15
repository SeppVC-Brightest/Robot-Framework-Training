*** Settings ***
Resource  basePage.robot

*** Variables ***
${EMAILCREATETXT}=      id:email_create
${CREATEACCOUNTBTN}=    id:SubmitCreate

*** Keywords ***
Create Account
    [Arguments]  ${emailaddress}
    Wait Until Element Is Visible  ${EMAILCREATETXT}
    Input Text  ${EMAILCREATETXT}  ${emailaddress}
    Click Element  ${CREATEACCOUNTBTN}