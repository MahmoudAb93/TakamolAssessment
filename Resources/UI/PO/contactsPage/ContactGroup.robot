*** Settings ***

Resource             ../../../Common.robot



*** Keywords ***



Add a new Contact Group
    click                   xpath=(//mat-icon[contains(text(),"add")])[2]
    click                   xpath=//span[contains(text(),"Create New Contact Group")]



Open Contact Group Editor
    click                   css=button[aria-label="Action"]
    click                   xpath=//span[contains(text(),"Edit Contact Group")]

Edit Contact Group name
    [Arguments]     ${name}
     fill text                css=.cdk-overlay-container input[type=text]   ${name}




Make Anyone in the team view the contact group
    click                   css=.cdk-overlay-container mat-slide-toggle[class="mat-slide-toggle mat-accent"]

Click on Update button
    click                   css=.cdk-overlay-container button[class="mat-focus-indicator primary-button mat-flat-button mat-button-base ng-star-inserted"]

Click on Cancel button
    Click    css=.cdk-overlay-container button[id="cancelButton"]

Check that error message has appeared
    Get Element             xpath=(//*[contains(concat(' ', normalize-space(@class), ' '), ' mat-error ')])[1]

Check that the button is disabled
    Get Element             css=.cdk-overlay-container button[disabled="true"]



Delete Contact Group
    click                   css=button[aria-label="Action"]
    click                   xpath=//span[contains(text(),"Delete Contact Group")]