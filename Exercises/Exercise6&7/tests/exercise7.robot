*** Settings ***
Resource  ../pageObjects/homePage.robot
Resource  ../pageObjects/aboutUsPage.robot
Resource  ../pageObjects/signInPage.robot
Resource  ../pageObjects/createAccountPage.robot

Suite Setup  Open My Store
Suite Teardown  Close browser

*** Test Cases ***
Register Without First Name
    Go To Signin Page
    Create Account  sepp.van.cauwenbergh@brightest.be
    Fill In Account Data    ${EMPTY}    Van Cauwenbergh    sepp.van.cauwenbergh@brightest.be    password    Sepp    Van Cauwenbergh    Satenrozen 10    Kontich    Tennessee    00000    United States    0478326598
    ${errorMessage}=  Get Create Account Error Message
    Should Contain  ${errorMessage}  firstname is required.