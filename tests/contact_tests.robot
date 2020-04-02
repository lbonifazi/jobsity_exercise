*** Settings ***
Resource    ../helpers/resource.robot

Library     PageObjectLibrary
Library     SeleniumLibrary
Library     Process
Library     ../pages/ContactPage.py

Suite Setup       Open Browser To Home Page
Suite Teardown    Close Browser

*** Keywords ***
User go to Contact page
    Go To    ${CONTACT URL}
    Contact page should be open

Contact page should be open
    Title Should Be  Contact us - My Store

Select the Subject Heading
    [Arguments]     ${option}
    When Select From List by Value  ${Subject List}  ${option}


*** Variables ***
${Attach File}          id:fileUpload
${Subject List}         id:id_contact
${Webmaster}            1
${Customer Service}     2

*** Test Cases ***
Contact Us form - Send a message for a Webmaster
     Given User go to Contact page
     When Select the Subject Heading  ${Webmaster}
     And enter email  test@test.com
     And enter order reference  1234
     And Choose File  ${Attach File}  ${DATA PATH}test.png
     And enter message  automation test message for webmaster
     And click the submit button
     Then Page Should Contain Element  ${SUCCESS ALERT}

Contact Us form - Send a message for a Customer Service
     Given User go to Contact page
     When Select the Subject Heading  ${Customer Service}
     And enter email  test@test.com
     And enter order reference  1234
     And Choose File  ${Attach File}  ${DATA PATH}test.png
     And enter message  automation test message for customer service
     And click the submit button
     Then Page Should Contain Element  ${SUCCESS ALERT}

Contact Us form - Validate whether field Subject is required
     Given User go to Contact page
     And enter email  test@test.com
     And enter order reference  1234
     And Choose File  ${Attach File}  ${DATA PATH}test.png
     And enter message  automation test without subject heading
     And click the submit button
     Then Page Should Contain Element  ${FAIL ALERT}

Contact Us form - Validate whether field Email is required
     Given User go to Contact page
     When Select the Subject Heading  ${Customer Service}
     And enter order reference  1234
     And Choose File  ${Attach File}  ${DATA PATH}test.png
     And enter message  automation test without email
     And click the submit button
     Then Page Should Contain Element  ${FAIL ALERT}

Contact Us form - Validate whether field File Attached and Order Reference are NOT required
     Given User go to Contact page
     When Select the Subject Heading  ${Customer Service}
     And enter email  test@test.com
     And enter message  automation test without order reference
     And click the submit button
     Then Page Should Contain Element  ${SUCCESS ALERT}

Contact Us form - Validate whether field Message is required
     Given User go to Contact page
     When Select the Subject Heading  ${Customer Service}
     And enter email  test@test.com
     And enter order reference  1234
     And Choose File  ${Attach File}  ${DATA PATH}test.png
     And click the submit button
     Then Page Should Contain Element  ${FAIL ALERT}

Contact Us form - Validate when blank space in Message field
     Given User go to Contact page
     When Select the Subject Heading  ${Webmaster}
     And enter email  test@test.com
     And enter order reference  1234
     And Choose File  ${Attach File}  ${DATA PATH}test.png
     And enter message  ${SPACE}
     And click the submit button
     Then Page Should Contain Element  ${FAIL ALERT}

Contact Us form - Validate required fields when any field completed
     Given User go to Contact page
     And click the submit button
     Then Page Should Contain Element  ${FAIL ALERT}

Contact Us form - Validate invalid email
     Given User go to Contact page
     When Select the Subject Heading  ${Webmaster}
     And enter email  test@test
     And enter order reference  1234
     And Choose File  ${Attach File}  ${DATA PATH}test.png
     And enter message  automation test message for webmaster
     And click the submit button
     Then Page Should Contain Element  ${FAIL ALERT}

Contact Us form - Validate symbols in email field
     Given User go to Contact page
     When Select the Subject Heading  ${Webmaster}
     And enter email  !"·$%@test.com
     And enter order reference  1234
     And Choose File  ${Attach File}  ${DATA PATH}test.png
     And enter message  automation test message for webmaster
     And click the submit button
     Then Page Should Contain Element  ${FAIL ALERT}