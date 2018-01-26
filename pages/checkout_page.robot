*** Settings ***
Library  Selenium2Library
Resource  base_page.robot
Resource  navigation_page.robot


*** Variables ***
${PROCEED_TO_CHECKOUT_2_BUTTON}  xpath=//p[contains(@class,'cart_navigation clearfix')]//a[contains(@title,'Proceed to checkout')]
${PROCESS_ADDRESS_BUTTON}  name=processAddress
${PROCESS_SHIPPING_BUTTON}  name=processCarrier
${ACCEPT_CHECKBOX}  xpath=//input[@id='cgv']
${BANK_WIRE_PAYMENT_OPTION}  xpath=//p[contains(@class,'payment_module')]//a[contains(@class,'bankwire') and contains(@title,'Pay by bank wire')]
${CONFIRM_ORDER_BUTTON}  xpath=//p[contains(@class,'cart_navigation clearfix')]//button
${SALE_COMPLETE_LABEL}  xpath=//div[contains(@class,'box')]//p[contains(@class,'cheque-indent')]


*** Keywords ***
# ***************************** WORKFLOWS *****************************************************************************
Move To Sign In Stage
    Click On Proceed To Checkout Button 2


Move To Shipping Stage
    Click On Process Address Button


Move To Payment Stage
    Click On Process Shipping Button


Accept Terms Of Service
    Select Terms Of Service Checkbox


Select Payment Option
    Click On Bank Wire Payment Button


Confirm Order
    Click On Confirm Order Button


# ***************************** VERIFICATION KEYWORDS*******************************************************************
Order Should Be Completed Successfully
    Wait Until Page Contains Element    ${SALE_COMPLETE_LABEL}  timeout=${TIME_OUT}
    Wait Until Element Is Visible       ${SALE_COMPLETE_LABEL}  timeout=${TIME_OUT}


# ***************************** ATOMIC COMMANDS ***********************************************************************
Click On Proceed To Checkout Button 2
    Click On Element  ${PROCEED_TO_CHECKOUT_2_BUTTON}


Click On Process Address Button
    Click On Element  ${PROCESS_ADDRESS_BUTTON}


Click On Process Shipping Button
    Click On Element  ${PROCESS_SHIPPING_BUTTON}


Select Terms Of Service Checkbox
    Click On Element  ${ACCEPT_CHECKBOX}


Click On Bank Wire Payment Button
    Click On Element  ${BANK_WIRE_PAYMENT_OPTION}


Click On Confirm Order Button
    Click On Element  ${CONFIRM_ORDER_BUTTON}