# Jobsity Automation Exercise

## Getting Started


### Prerequisites
- [Python 3](https://www.python.org/downloads/)
- Package Manager [pip](https://pip.pypa.io/en/stable/)

### Installing

For run this project, you must have robotframework, robotframework-pageobjectlibrary and robotframework-seleniumlibrary installed.

Use the package manager `pip` to install the those packages:
```bash
pip install robotframework
pip install --upgrade robotframework-pageobjectlibrary
pip install --upgrade robotframework-seleniumlibrary
```
You can see more information here: [robotframework Installation Instructions](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst)

If you don't have any browser driver installed in your machine, you have to execute the following command to install them:
```bash
pip install webdrivermanager
webdrivermanager firefox chrome --linkpath <path of your python3 folder>
```

Install the requirements:
```bash
pip install -r requirements.txt
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

### Reports / Results
After run the project, you can view the results report in the file located in `results/report.html`.

If some of the tests executed fail, then the system will take a screenshot of the page, which is saved into the `screenshot` folder.

## Built With
- Python3
- [RobotFramework](https://robotframework.org/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)

## Author
Leonel Bonifazi

