# Jobsity Automation Exercise

## Getting Started


### Prerequisites
- [Python 3](https://www.python.org/downloads/)
- Package Manager [pip](https://pip.pypa.io/en/stable/)

### Installing
Use the package manager *pip* to install the following packages:
```bash
pip install robotframework
pip install --upgrade robotframework-pageobjectlibrary
pip install --upgrade robotframework-seleniumlibrary
pip install webdrivermanager
pip install -r requirements.txt

webdrivermanager firefox chrome --linkpath <path of your python folder>
```

### Running the tests
Run the test with default browser
```bash
robot -d reports tests\contact_tests.robot
```

Run the test with Chrome browser
```bash
robot --variable BROWSER:Chrome -d reports tests\contact_tests.robot
```
Run the test with Firefox browser
```bash
robot --variable BROWSER:Firefox -d reports tests\contact_tests.robot
```

## Built With
- Python3
- [RobotFramework](https://robotframework.org/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)

## Author
Leonel Bonifazi

