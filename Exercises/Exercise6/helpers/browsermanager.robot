*** Settings ***
Library  SeleniumLibrary
Resource  ../webconfig.robot

*** Keywords ***
Setup Chrome Driver
    [Documentation]    Automatically manages Chrome driver for current OS
    ${driver_path}=    Evaluate    __import__('webdriver_manager.chrome').chrome.ChromeDriverManager().install()
    RETURN    ${driver_path}

Setup Firefox Driver
    [Documentation]    Automatically manages Firefox driver for current OS
    ${driver_path}=    Evaluate    __import__('webdriver_manager.firefox').firefox.GeckoDriverManager().install()
    RETURN    ${driver_path}

Open Browser With WebDriver Manager
    [Arguments]    ${url}    ${browser}=chrome
    IF    '${browser}'.lower() == 'chrome'
        ${driver_path}=    Setup Chrome Driver
        ${service}=    Evaluate    __import__('selenium.webdriver.chrome.service').webdriver.chrome.service.Service(r'''${driver_path}''')
        ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()
        Call Method    ${options}    add_argument    --disable-save-password-bubble
        Call Method    ${options}    add_argument    --no-first-run
        Call Method    ${options}    add_argument    --no-default-browser-check
        Call Method    ${options}    add_argument    --disable-translate

        ${prefs}=    Create Dictionary
        ...    credentials_enable_service=${False}
        ...    profile.password_manager_enabled=${False}
        ...    profile.password_manager_leak_detection=${False}
        Call Method    ${options}    add_experimental_option    prefs    ${prefs}
        Open Browser    ${url}    ${browser}    service=${service}    options=${options}
    ELSE IF    '${browser}'.lower() == 'firefox'
        ${driver_path}=    Setup Firefox Driver
        ${service}=    Evaluate    __import__('selenium.webdriver.firefox.service').webdriver.firefox.service.Service(r'''${driver_path}''')
        ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.FirefoxOptions()
        Call Method    ${options}    add_argument    --disable-prompt-on-repost
        Open Browser    ${url}    ${browser}    service=${service}    options=${options}
    ELSE
        Open Browser    ${url}    ${browser}
    END


