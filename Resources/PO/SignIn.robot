*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SIGN_IN_EMAIL} =          xpath=//*[@id="email"]
${SIGN_IN_PASSWORD} =       xpath=//*[@id="password"]
${REMEMBER_ME_BUTTON} =    xpath=//*[@id="remember"]
${LOGIN_SUBMIT_BUTTON} =    Login

*** Keywords ***
Navigate To
    log    ${LOGIN_URL}
#    ${SignInUrl} =    ${LOGIN_URL}
    go to    ${LOGIN_URL}

Enter Credentials
    [Arguments]  ${Credentials}
    log    ${SIGN_IN_EMAIL}
    log    ${SIGN_IN_PASSWORD}
    Input Text    ${SIGN_IN_EMAIL}    ${Credentials[0]}
    Input Text    ${SIGN_IN_PASSWORD}    ${Credentials[1]}

Click Submit
    click element    ${REMEMBER_ME_BUTTON}
    click button    ${LOGIN_SUBMIT_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
#    sleep    30s
    page should contain    ${ExpectedErrorMessage[2]}

Clear Input Fields
    clear element text    ${SIGN_IN_EMAIL}
    clear element text    ${SIGN_IN_PASSWORD}