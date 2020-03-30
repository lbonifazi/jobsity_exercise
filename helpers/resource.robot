*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SERVER}               www.automationpractice.com
${BROWSER}              Chrome
${DELAY}                0.5
${HOME URL}             http://${SERVER}/index.php
${CONTACT URL}          http://${SERVER}/index.php?controller=contact
${DATA PATH}            ${EXECDIR}${/}data${/}
${SCREENSHOT PATH}      ${EXECDIR}${/}screenshot${/}
${SUCCESS ALERT}        css:.alert.alert-success
${FAIL ALERT}           css:.alert.alert-danger

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${Home URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Set Screenshot Directory    ${SCREENSHOT PATH}
    Home Page Should Be Open

Close Browser
    Terminate all processes
    Close all browsers

Home Page Should Be Open
    Title Should Be    My Store
