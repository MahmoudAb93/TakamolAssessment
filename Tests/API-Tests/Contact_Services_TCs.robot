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
Resource    ../../Resources/API/ContactsServices.robot

*** Keywords ***
Open login session
    ${Response}  login  ${UserName}  ${Password}
    Should Be Equal As Strings    200    ${Response.status_code}
    ${Token}   Get Token    ${Response}
    [Return]    ${Token}
    
*** Test Cases ***
1-Create a contact group list
    [Tags]  Test   API  ContactServices    Happy  
    ${Contact_Group_Name}    generate random string         5       [LETTERS]
    ${Token}   Open Login Session
    ${Response}  Add Contact List    ${Token}    ${Contact_Group_Name}
    Should Be Equal As Strings    200    ${Response.status_code}
    ${ID}  Get List ID    ${Response}
    ${Response_2}  Add List ID    ${Token}   ${ID}
    Should Be Equal As Strings    200   ${Response_2.status_code}

2-Check that the user will not be able to create a contact group with an invalid access token
    [Tags]  Test   API  ContactServices    Negative
    ${Contact_Group_Name}    generate random string         5       [LETTERS]
    ${Token}   Set Variable    Invalid
    ${Response}  Add Contact List    ${Token}    ${Contact_Group_Name}
    Should Be Equal As Strings    401    ${Response.status_code}
