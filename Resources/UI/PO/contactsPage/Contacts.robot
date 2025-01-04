*** Settings ***

Resource             ../../../Common.robot



*** Keywords ***



Open Contacts Editor
    click                   xpath=//mat-icon[contains(text(),"group_add")]



Add a new contact
     Click               xpath=(//*[contains(concat(' ',normalize-space(@class),' '),' cdk-overlay-container ')]//button[@fxlayoutalign="start start"])[1]


Add mandatory contact details
    [Arguments]    ${name}    ${mobile}  ${email}
    click        (//*[contains(concat(' ',normalize-space(@class),' '),' cdk-overlay-container ')]//input[@type="text"])[1]
    Fill Text    (//*[contains(concat(' ',normalize-space(@class),' '),' cdk-overlay-container ')]//input[@type="text"])[1]    ${name}
    Fill Text    (//*[contains(concat(' ',normalize-space(@class),' '),' cdk-overlay-container ')]//input[@type="text"])[2]    ${mobile}
    Fill Text    (//*[contains(concat(' ',normalize-space(@class),' '),' cdk-overlay-container ')]//input[@type="email"])[1]   ${email}

Save Contact
    click                   xpath=//div[contains(@class, 'cdk-overlay-pane')]//button//span[contains(text(), "Save")]

Confirm added contact
    click                   xpath=//div[contains(@class, 'cdk-overlay-pane')]//button//span[contains(text(), "Confirm")]



Cancel Add contact
    click                   xpath=//div[contains(@class, 'cdk-overlay-pane')]//button//span[contains(text(), "Cancel")]
    click                   xpath=//div[contains(@class, 'cdk-overlay-pane')]//button//span[contains(text(), "Cancel")]