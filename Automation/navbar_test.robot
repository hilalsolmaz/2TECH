*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://2nhaber.com
${BROWSER}        Chrome
${SEARCH_QUERY}   İstanbul
${NEWS_INDEX}     8

*** Test Cases ***
Search And Open News
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Search Button
    Sleep    2
    Input Text    xpath://*[@id="cmsmasters-scroll-top"]/div/div/div/section/div/div[3]/div/div[2]/div/div/div[1]/div/form/div/input   İstanbul
    Sleep    2
    Press Keys    xpath://*[@id="cmsmasters-scroll-top"]/div/div/div/section/div/div[3]/div/div[2]/div/div/div[1]/div/form/div/input    ENTER
    Sleep    2


    Close Browser

*** Keywords ***
Click Search Button
    Click Element    xpath=//*[@id="cmsmasters-scroll-top"]/div/div/div/section/div/div[3]/div/div[2]

