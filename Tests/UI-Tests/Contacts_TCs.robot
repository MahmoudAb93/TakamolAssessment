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
Resource    ../../Resources/UI/PO/contactsPage/Contacts.robot
Resource    ../../Resources/Common.robot


Suite Setup          Run Keywords         New Browser               browser=${Chromium_Browser}    headless=${HEADED}
...                  AND                  Set Browser Timeout       1m
Test Setup           New Context          viewport={'width': 1920, 'height': 1080}
Test Timeout         1m
Test Teardown        Run Keywords         Delete Contact Group
...                  AND                  Close Context
Suite Teardown       Close Browser



*** Test Cases ***
1-Add a contact to the created Contact Group
     [Tags]       Test   UI  Contacts    Happy
    ${Name} =    generate random string         5     [NUMBERS]
    ${Mobile}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contacts Editor
     Add A New Contact
     Add Mandatory Contact Details    Contact_Name_${Name}    051${Mobile}   email@${Name}.com
     Save Contact
     Confirm Added Contact

2-Check that Contact name should not be empty
     [Tags]       Test   UI  Contacts    Negative
    ${Name} =    generate random string         5     [NUMBERS]
    ${Mobile}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contacts Editor
     Add A New Contact
     Add Mandatory Contact Details    ${EMPTY}    051${Mobile}   email@${Name}.com
     Check that error message has appeared
     Check that the button is disabled
     Cancel Add contact
     
3-Check that Contact number should not be empty
     [Tags]       Test   UI  Contacts    Negative
    ${Name} =    generate random string         5     [NUMBERS]
    ${Mobile}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contacts Editor
     Add A New Contact 
     Add Mandatory Contact Details    Contact_Name_${Name}    ${EMPTY}    email@${Name}.com
     Check that error message has appeared
     Check that the button is disabled
     Cancel Add contact 
     

4-Check that Contact email should not be empty
     [Tags]       Test   UI  Contacts    Negative
    ${Name} =    generate random string         5     [NUMBERS]
    ${Mobile}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contacts Editor
     Add A New Contact
     Add Mandatory Contact Details    Contact_Name_${Name}    051${Mobile}    ${EMPTY}
     Check that the button is disabled
     Cancel Add contact

5-Check that Contact email should not be in an invalid email format
     [Tags]       Test   UI  Contacts    Negative
    ${Name} =    generate random string         5     [NUMBERS]
    ${Mobile}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contacts Editor
     Add A New Contact
     Add Mandatory Contact Details    Contact_Name_${Name}    051${Mobile}    Invalid
     Check that the button is disabled
     Cancel Add contact

6-Check that Contact number should not be in an invalid format
     [Tags]       Test   UI  Contacts    Negative
    ${Name} =    generate random string         5     [NUMBERS]
    ${Mobile}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contacts Editor
     Add A New Contact
     Add Mandatory Contact Details    Contact_Name_${Name}    Invalid     email@${Name}.com
     Check that error message has appeared
     Check that the button is disabled
     Cancel Add contact


7-Check that Contact name should not have less than the minimum allowed characters
     [Tags]       Test   UI  Contacts    Negative
    ${Email} =    generate random string         5     [NUMBERS]
    ${Name} =    generate random string         1     [NUMBERS]
    ${Mobile}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contacts Editor
     Add A New Contact
     Add Mandatory Contact Details    ${EMPTY}    051${Mobile}   email@${Email}.com
     Check that error message has appeared
     Check that the button is disabled
     Cancel Add contact

8-Check that Contact name should not have more than the maximum allowed characters
     [Tags]       Test   UI  Contacts    Negative
    ${Email} =    generate random string         5     [NUMBERS]
    ${Name} =    generate random string         101     [NUMBERS]
    ${Mobile}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contacts Editor
     Add A New Contact
     Add Mandatory Contact Details    ${EMPTY}    051${Mobile}   email@${Email}.com
     Check that error message has appeared
     Check that the button is disabled
     Cancel Add contact


9-Check that the contact name should not be having an already existing number
     [Tags]       Test   UI  Contacts    Negative
    ${Name} =    generate random string         5     [NUMBERS]
    ${Mobile}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contacts Editor
     Add A New Contact
     Add Mandatory Contact Details    Contact_Name_${Name}    051${Mobile}   email@${Name}.com
     Save Contact
     Add A New Contact
     Add Mandatory Contact Details    Contact_Name_${Name}    051${Mobile}   email1@${Name}.com
     Check that error message has appeared
     Check that the button is disabled
     Cancel Add contact

10-Check that the contact name should not be having an already existing email
     [Tags]       Test   UI  Contacts    Negative
    ${Name} =    generate random string         5     [NUMBERS]
    ${Mobile}   generate random string         7       [NUMBERS]
    ${Mobile_new}   generate random string         7       [NUMBERS]
     Open SeeU-client site and fill login details  ${UserName}   ${Password}
     Click On Login Button
     Assert That The User Has Logged In Successfully
     Add a new Contact Group
     Open Contacts Editor
     Add A New Contact
     Add Mandatory Contact Details    Contact_Name_${Name}    051${Mobile}   email@${Name}.com
     Save Contact
     Add A New Contact
     Add Mandatory Contact Details    Contact_Name_${Name}    051${Mobile_new}   email@${Name}.com
     Save Contact
     Check that error message has appeared
     Cancel Add contact