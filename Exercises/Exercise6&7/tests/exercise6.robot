*** Settings ***
Resource  ../pageObjects/homePage.robot
Resource  ../pageObjects/aboutUsPage.robot

Suite Setup  Open My Store
Suite Teardown  Close browser

*** Test Cases ***
About Us Verification
    Go To About Us
    Sleep  5s
    ${text}=  Get About Us Text
    Should Contain  ${text}  We are a team of technology enthusiasts and our primary goal for this website and company is to give you a platform to practice Continuous Test Automation. We are a subsidiary of seleniumframework.com