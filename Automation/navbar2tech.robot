*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://2nhaber.com/

*** Test Cases ***
Verify All Navbar Links
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//*[@id="cmsmasters-scroll-top"]/div/div/div/section/div/div[2]/div/div/div/nav  # Navbar öğelerinin yüklendiğinden emin ol
    ${navbar_links}=    Get WebElements    xpath=//*[@id="cmsmasters-scroll-top"]/div/div/div/section/div/div[2]/div/div/div/nav//ul/li/a  # Navbar içindeki tüm <a> öğelerini al
    ${link_count}=    Get Length    ${navbar_links}
    Log To Console    Found ${link_count} navbar links to test.

    # Döngü ile Navbar Linklerini Test Et
    FOR    ${index}    IN RANGE    0    ${link_count}
        Log To Console    Testing Navbar Link ${index + 1} of ${link_count}

        # Navbar öğelerini tekrar al
        ${navbar_links}=    Get WebElements    xpath=//*[@id="cmsmasters-scroll-top"]/div/div/div/section/div/div[2]/div/div/div/nav//ul/li/a

        # Hangi bağlantıya tıklanacağını seç
        ${current_link}=    Get WebElement    ${navbar_links}[${index}]
        ${link_text}=       Get Text    ${current_link}
        ${href}=            Get Element Attribute    ${current_link}    href
        Log To Console    Clicking on link: ${link_text} (${href})

        # Bağlantıya tıkla ve doğrula
        Click Element    ${current_link}
        Wait Until Page Contains Element    xpath=//body  # Sayfanın yüklendiğinden emin ol
        Log To Console    Successfully navigated to: ${link_text}

        # Geri dön ve yeniden bekle
        Go Back
        Wait Until Page Contains Element    xpath=//*[@id="cmsmasters-scroll-top"]/div/div/div/section/div/div[2]/div/div/div/nav  # Navbar yeniden yükleniyor mu kontrol et
    END

    # Testi sonlandır
    Close Browser
