*** Settings ***
Resource  ../stepDefinitions/loginStepDefinitions.robot
Resource  ../stepDefinitions/secureStepDefinitions.robot

Suite Setup  Open The Internet
Suite Teardown  Close browser

*** Test Cases ***
Correct login
    Given the login page is open
    When a user logs in
    Then the secure area is shown