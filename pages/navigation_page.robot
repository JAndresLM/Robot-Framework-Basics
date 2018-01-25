*** Settings ***
Library  Selenium2Library
Resource  base_page.robot

*** Variables ***
${SIGN_IN_LINK}  xpath=//div[contains(@class,'header_user_info')]//a[contains(text(),'Sign in')]
${SING_OUT_LINK}  xpath=//div[contains(@class,'header_user_info')]//a[contains(text(),'Sign out')]
${USERNAME_LABEL}   xpath=//div[contains(@class,'header_user_info')]//a[contains(@class,'account')]//span


*** Keywords ***
# ***************************** WORKFLOWS *****************************************************************************
Go To Login Page
    Click On Sign In Link


Close Session
    Click On Sign Out Link


# ***************************** ATOMIC COMMANDS ***********************************************************************
Click On Sign In Link
    Click On Element  ${SIGN_IN_LINK}


Click On Sign Out Link
    Click On Element  ${SING_OUT_LINK}


Get Logged In Username
    Wait Until Element Is Visible   ${USERNAME_LABEL}      timeout=${TIME_OUT}
    ${logged_username}  Get Text  ${USERNAME_LABEL}
    [return]  ${logged_username}