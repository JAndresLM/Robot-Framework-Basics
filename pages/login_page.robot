*** Settings ***
Resource  base_page.robot
Resource  navigation_page.robot
Variables  ../resources/error_messages.py


*** Variables ***
${SIGN_IN_LINK}  xpath=//div[contains(@class,'header_user_info')]//a[contains(text(),'Sign in')]
${EMAIL_TEXTFIELD}   xpath=//form[contains(@id,'login_form')]//input[contains(@id,'email')]
${PASSWORD_TEXTFIELD}   xpath=//form[contains(@id,'login_form')]//input[contains(@id,'passwd')]
${SIGN_IN_BUTTON}   xpath=//form[contains(@id,'login_form')]//button[contains(@id,'SubmitLogin')]
${ERROR_MESSAGE_LABEL}   xpath=//div[contains(@class,'alert alert-danger')]//ol//li


*** Keywords ***
# ***************************** WORKFLOWS *****************************************************************************
Attempt To Login
    [Arguments]  ${email}  ${password}
    Type Email  ${email}
    Type Password  ${password}
    Click On Sign In Button


# ***************************** VERIFICATION KEYWORDS*******************************************************************
Login Should Be Successful
    [Arguments]  ${expected_username}
    ${current_username}   Get Logged In Username
    Should Be Equal  ${current_username}  ${expected_username}


Login Should Fail By Authentication Error
    ${current_error_message}=  Get Error Message From Alert
    Should Be Equal    ${current_error_message}  ${EXPECTED_AUTHENTICATION_FAILED_MESSAGE}


Login Should Fail By Invalid Email
    ${current_error_message}  Get Error Message From Alert
    Should Be Equal    ${current_error_message}  ${INVALID_EMAIL}


# ***************************** ATOMIC COMMANDS ***********************************************************************
Type Email
    [Arguments]  ${email}
    Type On Input Field  ${EMAIL_TEXTFIELD}  ${email}


Type Password
    [Arguments]  ${password}
    Type On Input Field  ${PASSWORD_TEXTFIELD}  ${password}


Click On Sign In Button
    Click On Element  ${SIGN_IN_BUTTON}


Get Error Message From Alert
    ${error_message}  Get Text  ${ERROR_MESSAGE_LABEL}
    [Return]   ${error_message}