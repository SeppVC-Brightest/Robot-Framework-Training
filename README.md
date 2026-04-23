# Robot Framework Training

Complete Robot Framework training project with examples and exercises for learning modern RF 7.4.2 syntax with Selenium automation.

## Prerequisites Installation

### 1. Git

**macOS (Homebrew):**
```bash
brew install git
```

**Windows:**
- Download from https://git-scm.com/download/win
- Run the installer and follow the prompts

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install git
```

Verify installation:
```bash
git --version
```

### 2. Python

**macOS (Homebrew):**
```bash
brew install python3
```

**Windows:**
- Download from https://www.python.org/downloads/
- Check "Add Python to PATH" during installation
- Run the installer

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install python3 python3-pip
```

Verify installation:
```bash
python3 --version
```

### 3. IDE - Visual Studio Code (Recommended)

**macOS:**
```bash
brew install visual-studio-code
```

**Windows:**
- Download from https://code.visualstudio.com/
- Run the installer

**Linux:**
```bash
sudo apt-get install code
```

Recommended Extensions:
- **Robot Framework Language Server** (robocorp.robotframework-lsp)
- **Python** (ms-python.python)

## Robot Framework Setup

### Step 1: Clone or Navigate to Project

```bash
git clone <repository-url>
cd Robot-Framework-Training
```

### Step 2: Create Virtual Environment

```bash
python3 -m venv .venv
```

### Step 3: Activate Virtual Environment

**macOS/Linux:**
```bash
source .venv/bin/activate
```

**Windows:**
```bash
.venv\Scripts\activate
```

### Step 4: Install Dependencies

```bash
pip install --upgrade pip
pip install robotframework==7.4.2
pip install robotframework-requests==0.9.7
pip install robotframework-seleniumlibrary==6.8.0
pip install webdriver-manager==4.0.1
pip install requests==2.33.1
```

**Or install all at once:**
```bash
pip install -r requirements.txt
```

### Step 5: Verify Installation

```bash
robot --version
```

Should output: `Robot Framework 7.4.2`

## Project Structure

```
Robot-Framework-Training/
├── Examples/              # Reference implementations
│   ├── resources/         # Shared resources
│   ├── selenium/          # Selenium examples
│   ├── rest/              # REST API examples
│   └── gherkin/           # BDD examples
├── Exercises/             # Training exercises
│   ├── Exercise0/         # Hello World
│   ├── Exercise1-5/       # Logic & conditionals
│   ├── Exercise6&7/       # Web automation
│   └── Exercise8/         # REST API automation
└── README.md              # This file
```

## Running Tests

### Run All Tests
```bash
robot Examples/
robot Exercises/
```

### Run Specific Test
```bash
robot Examples/logicalOperators.robot
robot Examples/selenium/tests/login.robot
```

### Run with Output
```bash
robot --outputdir ./reports Examples/
```

### Generate Reports
Reports are automatically generated in each `reports/` directory:
- `log.html` - Detailed execution log
- `report.html` - Summary report
- `output.xml` - Machine-readable output

## Modern Robot Framework 7.4.2 Features

This project uses modern RF 7.4.2 syntax:

- ✅ **IF/ELSE/END** instead of `Run Keyword If`
- ✅ **BREAK/CONTINUE** instead of loop keywords
- ✅ **RETURN** instead of `[Return]`
- ✅ **Built-in variable declarations** instead of `${VAR}=`
- ✅ **Session-based HTTP API** instead of deprecated `Get Request`
- ✅ **SeleniumLibrary 6.8.0** with modern service configuration
- ✅ **WebDriver Manager** for automatic driver management (cross-platform)

## Browser Automation

### Supported Browsers

**Chrome:**
- Automatically managed by webdriver-manager
- Version 147.0+

**Firefox:**
- Automatically managed by webdriver-manager  
- Latest stable version

### Configuration

Browser and URL configured in `webconfig.robot`:

```robot
*** Variables ***
${BROWSER}     chrome
${BASE_URL}    https://the-internet.herokuapp.com/
```

Switch browsers by changing `${BROWSER}`:
```robot
${BROWSER}     firefox
```

## Troubleshooting

### ModuleNotFoundError: SeleniumLibrary
Ensure you're using the virtual environment:
```bash
source .venv/bin/activate
pip install robotframework-seleniumlibrary
```

### Chromedriver Version Mismatch
WebDriver Manager automatically handles driver downloads. If you see warnings:
1. Delete any manually installed chromedriver: `rm /opt/homebrew/bin/chromedriver`
2. Let webdriver-manager handle it automatically

### Element Not Found
Add explicit waits in page objects:
```robot
Wait Until Element Is Visible    ${LOCATOR}    10s
```

## Libraries Used

| Library | Version | Purpose |
|---------|---------|---------|
| robotframework | 7.4.2 | Core framework |
| robotframework-seleniumlibrary | 6.8.0 | Web automation |
| robotframework-requests | 0.9.7 | REST API testing |
| webdriver-manager | 4.0.1 | Cross-platform driver management |
| requests | 2.33.1 | HTTP client |

## Quick Start Example

```robot
*** Settings ***
Resource    ../pageObjects/loginPage.robot

*** Test Cases ***
Login Successfully
    Open Browser With WebDriver Manager    https://the-internet.herokuapp.com/login
    Login    tomsmith    SuperSecretPassword!
    ${message}=    Get Text    css:.flash
    Should Contain    ${message}    You logged into a secure area
    Close Browser
```

## Additional Resources

- [Robot Framework Documentation](https://robotframework.org/)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/)
- [WebDriver Manager Documentation](https://github.com/SergeyPirogov/webdriver_manager)

## License

Educational - Robot Framework Training Project