*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SIGN_IN_EMAIL}          //input[@class="input ng-pristine ng-untouched ng-valid ng-empty"]
${SIGN_IN_PASSWORD}       //input[@class="input password-input ng-pristine ng-untouched ng-valid ng-empty"]
${LOGIN_SUBMIT_BUTTON}    //button[@class="cui-button"]

*** Keywords ***
Navigate To
    ${SignInUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}  ${LOGIN_URL}
    go to  ${SignInUrl}
    wait until element is visible  ${SIGN_IN_EMAIL}
    wait until element is visible  ${SIGN_IN_PASSWORD}
    wait until element is visible  ${LOGIN_SUBMIT_BUTTON}

Enter Credentials
    [Arguments]  ${Credentials}
    run keyword unless  '${Credentials.Email}' == '#BLANK'  Input Text  ${SIGN_IN_EMAIL}  ${Credentials.Email}
    run keyword unless  '${Credentials.Password}' == '#BLANK'  Input Text  ${SIGN_IN_PASSWORD}  ${Credentials.Password}

Click Submit
    click element  ${LOGIN_SUBMIT_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage}

Clear Input Fields
    Clear Element Text  ${SIGN_IN_EMAIL}
    Clear Element Text  ${SIGN_IN_PASSWORD}