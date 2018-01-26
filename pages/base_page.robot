*** Settings ***
Library  Selenium2Library


*** Variables ***
${APP_URL}  http://automationpractice.com/index.php
${BROWSER}  chrome
${TIME_OUT}  15s


*** Keywords ***
Go To Platform
    Open Browser  ${APP_URL}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed   0.9


Click On Element
    [Arguments]  ${element}
    Wait Until Element is Enabled   ${element}      timeout=${TIME_OUT}
    Click Element   ${element}


Type On Input Field
    [Arguments]  ${input_field}  ${text}
    Wait Until Element is Enabled   ${input_field}      timeout=${TIME_OUT}
    Clear Element Text  ${input_field}
    Input Text      ${input_field}      ${text}