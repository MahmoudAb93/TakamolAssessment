#######     Runners     ########
# py -m robot -d Results      -i       Test        Tests
# py -m robot -d Results      -i       UI        Tests
# py -m robot -d Results      -i       API        Tests
# py -m robot -d Results      -i       Happy        Tests
# py -m robot -d Results      -i       Negative        Tests
# py -m robot -d Results      -i       PublicForm        Tests
# py -m robot -d Results      -i       Contacts        Tests
# py -m robot -d Results      -i       ContactGroup        Tests
# py -m robot -d Results      -i       ContactServices        Tests
# py -m robot -d Results      -i       LoginService        Tests

*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Library     OperatingSystem
Resource   ../../Resources/Common.robot
Resource    ../../Resources/API/LoginService.robot



*** Test Cases ***
1-Open a login session with valid credentials
    [Tags]  Test   API  LoginService    Happy  
    ${Response}  login  ${UserName}  ${Password}
    Should Be Equal As Strings    200    ${Response.status_code}

2-Check that the user will not be able to login with invalid credentials
    [Tags]  Test   API  LoginService    Negative
    ${Response}  login  ${UserName}   Invalid
    Should Be Equal As Strings    400    ${Response.status_code}