*** Settings ***
Library  Selenium2Library
Resource  base_page.robot
Resource  navigation_page.robot


*** Variables ***
${DRESS}  xpath=//div[contains(@class,'product-image-container')]//a[contains(@class,'product_img_link') and contains(@title,'Blouse')]
${ADD_TO_CAR_BUTTON}  xpath=//div[contains(@class,'button-container')]//a[contains(@title,'Add to cart') and contains(@data-id-product,'2')]
${PROCEED_TO_CHECKOUT_BUTTON}  xpath=//div[contains(@class,'button-container')]//a[contains(@title,'Proceed to checkout')]
${PROCEED_TO_CHECKOUT_2_BUTTON}  xpath=//p[contains(@class,'cart_navigation clearfix')]//a[contains(@title,'Proceed to checkout')]

${PASSWORD_TEXTFIELD}   xpath=//form[contains(@id,'login_form')]//input[contains(@id,'passwd')]
${SIGN_IN_BUTTON}   xpath=//form[contains(@id,'login_form')]//button[contains(@id,'SubmitLogin')]
${ERROR_MESSAGE_LABEL}   xpath=//div[contains(@class,'alert alert-danger')]//ol//li


*** Keywords ***
# ***************************** WORKFLOWS *****************************************************************************
Add Product To Card and Proceed With Checkout
    Hover on item
    Click On Add To Car Button
    Click On Proceed To Checkout Button


Hover on item
    Mouse Over  ${DRESS}


# ***************************** VERIFICATION KEYWORDS*******************************************************************



# ***************************** ATOMIC COMMANDS ***********************************************************************
Click On Add To Car Button
    Click On Element  ${ADD_TO_CAR_BUTTON}


Click On Proceed To Checkout Button
    Click On Element  ${PROCEED_TO_CHECKOUT_BUTTON}
