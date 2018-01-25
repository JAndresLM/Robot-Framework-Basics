*** Settings ***
Library  Selenium2Library
Resource  ../pages/navigation_page.robot
Resource  ../pages/login_page.robot
Resource  ../resources/wrong_entries.robot

Suite Setup      Go To Platform
Test Setup        Go To Login Page
Suite Teardown    Close All Browsers


*** Variables ***
${EMAIL}        josandlopmol@hotmail.com
${PASSWORD}     AndresLM123
${EXPECTED_USERNAME}     Andres Lopez


*** Test Cases ***
Login With Valid Credentials
    [Tags]  smoke
    Attempt To Login  ${EMAIL}  ${PASSWORD}
    Login Should Be Successful  ${EXPECTED_USERNAME}
    [Teardown]  Close Session


Login With Invalid Credentials
    [Tags]  negative_scenario
    Attempt To Login  ${EMAIL}  ${WRONG_PASSWORD}
    Login Should Fail By Authentication Error


Login With Invalid Email Address
    [Tags]  negative_scenario
    Attempt To Login  abc  ${PASSWORD}
    Login Should Fail By Invalid Email
