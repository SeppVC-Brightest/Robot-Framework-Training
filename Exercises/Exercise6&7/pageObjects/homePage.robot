*** Settings ***
Resource  basePage.robot

*** Variables ***
${SIGNINLNK}=       css:.header_user_info > a
${ABOUTUSLNK}=      css:[title='About us']

*** Keywords ***
Go To Signin Page
    Click Element  ${SIGNINLNK}

Go To About Us
    Click Element  ${ABOUTUSLNK}