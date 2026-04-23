*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Setup Chrome Driver
    [Documentation]    Automatically manages Chrome driver for current OS
    ${driver_path}=    Evaluate    __import__('webdriver_manager.chrome').chrome.ChromeDriverManager().install()
    RETURN    ${driver_path}

Open Browser With WebDriver Manager
    [Arguments]    ${url}    ${browser}=chrome
    ${driver_path}=    Setup Chrome Driver
    ${service}=    Evaluate    __import__('selenium.webdriver.chrome.service').webdriver.chrome.service.Service('${driver_path}')
    Open Browser    ${url}    ${browser}    service=${service}


    