*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${sign_in_email}          //input[@class="input ng-pristine ng-untouched ng-valid ng-empty"]
${sign_in_password}       //input[@class="input password-input ng-pristine ng-untouched ng-valid ng-empty"]
${login_submit_button}    //button[@class="cui-button"]

*** Keywords ***
Navigate To
    ${SignInUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}  ${LOGIN_URL}
    go to  ${SignInUrl}
    wait until element is visible  ${sign_in_email}
    wait until element is visible  ${sign_in_password}
    wait until element is visible  ${login_submit_button}

Enter Credentials
    [Arguments]  ${Credentials}
    run keyword unless  '${Credentials.Email}' == '#BLANK'  Input Text  ${sign_in_email}  ${Credentials.Email}
    run keyword unless  '${Credentials.Password}' == '#BLANK'  Input Text  ${sign_in_password}  ${Credentials.Password}

Click Submit
    click element  ${login_submit_button}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage}

Clear Input Fields
    Clear Element Text  ${sign_in_email}
    Clear Element Text  ${sign_in_password}