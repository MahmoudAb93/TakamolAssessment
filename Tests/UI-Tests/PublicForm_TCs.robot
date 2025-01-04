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
Resource    ../../Resources/UI/PO/contactsPage/PublicForm.robot
Resource    ../../Resources/Common.robot


Suite Setup          Run Keywords         New Browser               browser=${Chromium_Browser}    headless=${HEADED}
...                  AND                  Set Browser Timeout       1m
Test Setup           New Context          viewport={'width': 1920, 'height': 1080}
Test Timeout         1m
Test Teardown        Close Context
Suite Teardown       Close Browser



*** Test Cases ***
1-Add a new a date type question
     [Tags]       Test   UI  PublicForm    Happy
    ${Contact_Group_Name} =    generate random string         5       [LETTERS]
    ${Question_Name} =    generate random string         3      [NUMBERS]
    ${Question_Type_Name}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contact Group Editor
     Edit Contact Group name    test_Auto_${Contact_Group_Name}
     Click on Update button
     Open Public Form Editor
     Add A New Question
     Select A Question Of A Date Type
     Add A Date Question    test_Auto_Date_${Question_Name}    New_Test_Auto${Question_Type_Name}
     Save Form

2-Add a new a select type question
     [Tags]       Test   UI  PublicForm    Happy
    ${Contact_Group_Name} =    generate random string         5       [LETTERS]
    ${Question_Name} =    generate random string         3      [NUMBERS]
    ${Question_Type_Name}   generate random string         7       [NUMBERS]
    ${Option1} =    generate random string         3      [NUMBERS]
    ${Option2} =    generate random string         3      [NUMBERS]    
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contact Group Editor
     Edit Contact Group name    test_Auto_${Contact_Group_Name}
     Click on Update button
     Open Public Form Editor
     Add A New Question
     Select A Question Of A Select Type
     Add A Select Question  test_Auto_Select_${Question_Name}    New_Test_Auto${Question_Type_Name}      
     Add Option    1  ${Option1}
     Add Option    2  ${Option2}
     Save Form

3-Add a new a rate type question
     [Tags]       Test   UI  PublicForm    Happy
    ${Contact_Group_Name} =    generate random string         5       [LETTERS]
    ${Question_Name} =    generate random string         3      [NUMBERS]
    ${Question_Type_Name}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contact Group Editor
     Edit Contact Group name    test_Auto_${Contact_Group_Name}
     Click on Update button
     Open Public Form Editor
     Add A New Question
     Select A Question Of A Rating Type
     Add A Rating Question    test_Auto_Rate_${Question_Name}    New_Test_Auto${Question_Type_Name}
     Save Form

4-Add a combination of different types of questions
     [Tags]       Test   UI  PublicForm    Happy
    ${Contact_Group_Name} =    generate random string         5       [LETTERS]
    ${Question_Name} =    generate random string         3      [NUMBERS]
    ${Question_Type_Name}   generate random string         7       [NUMBERS]
    ${Option1} =    generate random string         3      [NUMBERS]
    ${Option2} =    generate random string         3      [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contact Group Editor
     Edit Contact Group name    test_Auto_${Contact_Group_Name}
     Click on Update button
     Open Public Form Editor
     Add A New Question
     Select A Question Of A Date Type
     Add A Date Question    test_Auto_Date_${Question_Name}     Date_type_1${Question_Type_Name}
     Add A New Question
     Select A Question Of A Select Type
     Add A Select Question  test_Auto_Select_${Question_Name}      Select_type_1${Question_Type_Name}
     Add Option    1  ${Option1}
     Add Option    2  ${Option2}
     Add A New Question
     Select A Question Of A Rating Type
     Add A Rating Question    test_Auto_Rate_${Question_Name}      Rate_type_1${Question_Type_Name}
     Save Form

5-Add a new a new question with an empty question name 
     [Tags]       Test   UI  PublicForm    Negative
    ${Contact_Group_Name} =    generate random string         5       [LETTERS]
    ${Question_Type_Name}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contact Group Editor
     Edit Contact Group name    test_Auto_${Contact_Group_Name}
     Click on Update button
     Open Public Form Editor
     Add A New Question
     Select A Question Of A Rating Type
     Add A Rating Question    ${EMPTY}    New_Test_Auto${Question_Type_Name}
     Check that error message has appeared
     Check that the button is disabled
     
