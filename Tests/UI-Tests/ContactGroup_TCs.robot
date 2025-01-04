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

Resource    ../../Resources/UI/PO/loginPage/Login.robot
Resource    ../../Resources/UI/PO/contactsPage/ContactGroup.robot
Resource    ../../Resources/Common.robot


Suite Setup          Run Keywords         New Browser               browser=${Chromium_Browser}    headless=${HEADED}
...                  AND                  Set Browser Timeout       1m
Test Setup           New Context          viewport={'width': 1920, 'height': 1080}
Test Timeout         1m
Test Teardown        Run Keywords         Delete Contact Group
...                  AND                 Close Context
Suite Teardown       Close Browser



*** Test Cases ***
1-Add a new contact group
     [Tags]       Test   UI  ContactGroup    Happy
    ${Contact_Group_Name} =    generate random string         5       [LETTERS]

     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contact Group Editor
     Edit Contact Group name    test_Auto_${Contact_Group_Name}
     Click on Update button

2-Add a new contact group with an empty name
     [Tags]       Test   UI  ContactGroup    Negative

     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contact Group Editor
     Edit Contact Group name    ${EMPTY}
     Make Anyone in the team view the contact group
     Check that error message has appeared
     Check that the button is disabled
     Click On Cancel Button

3-Add a new contact group with a name having less than the minimum allowed characters
     [Tags]       Test   UI  ContactGroup    Negative
    ${Contact_Group_Name} =    generate random string         1       [LETTERS]

     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contact Group Editor
     Edit Contact Group name    ${Contact_Group_Name}
     Make Anyone in the team view the contact group
     Check that error message has appeared
     Check that the button is disabled
     Click On Cancel Button


4-Add a new contact group with a name having more than the maximum allowed characters
     [Tags]       Test   UI  ContactGroup    Negative
    ${Contact_Group_Name} =    generate random string         101       [LETTERS]

     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contact Group Editor
     Edit Contact Group name    ${Contact_Group_Name}
     Make Anyone in the team view the contact group
     Check that error message has appeared
     Check that the button is disabled
     Click On Cancel Button
