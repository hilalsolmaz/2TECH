*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}       https://2nhaber.com
${BROWSER}        chrome
${ARTICLE}        6    # 6. haber başlığına tıklamak için sıralama (dinamik olarak değiştirilebilir)

*** Test Cases ***
Click Dynamic News Headline
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Search Button
    Sleep    2
    Input Text    xpath://*[@id="cmsmasters-scroll-top"]/div/div/div/section/div/div[3]/div/div[2]/div/div/div[1]/div/form/div/input   İstanbul
    Press Keys    xpath://*[@id="cmsmasters-scroll-top"]/div/div/div/section/div/div[3]/div/div[2]/div/div/div[1]/div/form/div/input    ENTER
    Sleep    2
    Scroll Element Into View    xpath://*[@id="post-34521"]
    Click Article
    Sleep    2
    Click Element    xpath://*[@id="post-34521"]/div/div/div/div/section/div/div[2]/div/div[1]/div/h3/a
    Sleep    2
    Close Browser

*** Keywords ***
Click Search Button
    Click Element    xpath=//*[@id="cmsmasters-scroll-top"]/div/div/div/section/div/div[3]/div/div[2]
Click Article
    ${article_xpath}=    Set Variable    xpath=//article[${ARTICLE}]//h3/a
    Wait Until Element Is Visible    ${article_xpath}
    Click Element    ${article_xpath}




