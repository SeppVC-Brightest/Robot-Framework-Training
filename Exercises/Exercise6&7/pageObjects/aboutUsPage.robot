*** Settings ***
Resource  basePage.robot

*** Variables ***
${ABOUTUSTXT}=       css:#center_column > div > div > div:nth-child(1) > div

*** Keywords ***
Get About Us Text
    ${text}=  Get Text  ${ABOUTUSTXT}
    [Return]  ${text}