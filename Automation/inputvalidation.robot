*** Settings ***
Library   SeleniumLibrary


*** Variables ***
${url}       https://www.flipkart.com
${browser}    chrome

*** Test Cases ***
ValidationTest
     open browser   ${url}    ${browser}
     wait until page contains  ${url}
     maximize browser window
     title should be  Online Shopping Site for Mobiles, Electronics, Furniture, Grocery, Lifestyle, Books & More. Best Offers!
     ${input_txt}   set variable   xpath:/html/body/div[2]/div/div/div/div/div[2]/div/form/div[1]/input
     element should be enabled  ${input_txt}
     element should be visible  ${input_txt}
     sleep  3
     input text         xpath:/html/body/div[2]/div/div/div/div/div[2]/div/form/div[1]/input    hilalslmaz@outlook.com
     sleep  3
     clear element text  xpath:/html/body/div[2]/div/div/div/div/div[2]/div/form/div[1]/input
     sleep  3
     close browser



*** Keywords ***
