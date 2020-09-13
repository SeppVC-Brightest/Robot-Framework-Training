*** Settings ***
Resource  ../../selenium/pageObjects/loginPage.robot

*** Keywords ***
The Login Page Is Open
    Go To Loginpage

A User Logs In
    Login With Username and Password  ${USERNAME}  ${PASSWORD}