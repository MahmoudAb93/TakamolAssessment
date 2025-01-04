*** Settings ***

Resource    ../../../Common.robot



*** Keywords ***

Open SeeU-client site and fill login details
    [Arguments]     ${userName}     ${password}
        New Page            ${Base_URL}
        fill text           css=input[type="email"]        ${userName}
        fill text        	css=input[formcontrolname="password"]                 ${password}

Click on login button
        click    		css=button[type="submit"]


Assert that the user has logged in successfully
        Get Element       css=div[title="Candidates"]

