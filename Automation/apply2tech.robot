*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}          https://www.2ntech.com.tr/hr
${BROWSER}      chrome
${FILE_PATH}    C:\Users\hilal\Downloads\CV_HilalSolmaz.pdf.pdf

*** Test Cases ***
Input Text
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # 1. Adım: Formu doldur
    Wait Until Element Is Visible    //*[@id='name']    timeout=10s
    Wait Until Element Is Visible    //*[@id='birth']    timeout=10s
    Wait Until Element Is Visible    //*[@id='tcKimlik']    timeout=10s
    Wait Until Element Is Visible    //*[@id='phone']    timeout=10s
    Wait Until Element Is Visible    //*[@id='email']    timeout=10s
    Wait Until Element Is Visible    //*[@id='phone']    timeout=10s
    Input Text    //*[@id="birth"]       19.07.2001
    Input Text    //*[@id="tcKimlik"]    16267110970
    Input Text    //*[@id="name"]        Hilal Solmaz
    Input Text    //*[@id='phone']       05301195416
    Input Text    //*[@id="email"]       hilalslmaz@outlook.com

    Sleep    2
    Click Element         xpath:/html/body/div[1]/div[2]/div[2]/div[2]/form/div[4]/div/label[2]
   # Execute JavaScript    document.getElementById('cv_field').removeAttribute('hidden');
    Choose File    xpath:/html/body/div[1]/div[2]/div[2]/div[2]/form/div[4]/div/label[2]    ${FILE_PATH}
    Click Element    xpath=//label[@for="cv_field"]  # Label'e tıkla
    Choose File      id=cv_field    ${FILE_PATH}  # Dosya yükle
   # Execute JavaScript    document.getElementById("cv_field").removeAttribute("hidden")
   # Wait Until Element Is Visible  xpath:/html/body/div[1]/div[2]/div[2]/div[2]/form/div[4]/div/label[2]
   # Wait Until Element Is Visible    id=cv_field
   # Choose File    id=cv_field    ${FILE_PATH}
    Close Browser
    # Gerekirse formu submit edebiliriz veya dosya yüklemesini başlatabiliriz
    Submit Form    # Burada form submit işlemi yapılabilir
    Click Button          xpath:/html/body/div[1]/div[2]/div[2]/div[2]/form/div[5]/div/button[2]
    Sleep    2
    Click Button          xpath://*[@id="pdp1"]
    Click Button          xpath:/html/body/div[1]/div[2]/div[2]/div[2]/form/div[7]/button
    Click Element         xpath:/html/body/div[1]/div[2]/div[2]/div[2]/div[3]/div[1]/div/div[2]

    Close Browser
*** Keywords ***

