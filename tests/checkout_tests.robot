*** Settings ***
Library  Selenium2Library
Resource  ../pages/navigation_page.robot
Resource  ../pages/home_page.robot
Resource  ../pages/login_page.robot
Resource  ../pages/checkout_page.robot

Suite Setup         Go To Platform
Suite Teardown      Close All Browsers


*** Variables ***
${EMAIL}        josandlopmol@hotmail.com
${PASSWORD}     AndresLM123
${EXPECTED_USERNAME}     Andres Lopez


*** Test Cases ***
Complete Sale From Beginning
    [Tags]  checkout
    Add Product To Card and Proceed With Checkout
    Move To Sign In Stage
    Attempt To Login  ${EMAIL}  ${PASSWORD}
    Move To Shipping Stage
    Accept Terms Of Service
    Move To Payment Stage
    Select Payment Option
    Confirm Order
    Order Should Be Completed Successfully