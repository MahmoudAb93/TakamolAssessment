*** Settings ***

Resource             ../../../Common.robot



*** Keywords ***



Open public form editor
    click                   xpath=//mat-icon[contains(text(),"ballot")]



Add a new question

     click       xpath=(//*[contains(concat(' ',normalize-space(@class),' '),' cdk-overlay-container ')]//textarea[@formcontrolname="headline"])[1]
     Click               xpath=(//*[contains(concat(' ',normalize-space(@class),' '),' cdk-overlay-container ')]//button[@class="mat-focus-indicator mat-menu-trigger add mat-icon-button mat-button-base"])[1]




Select a question of a date type
    click                   xpath=//div[contains(@class, 'cdk-overlay-pane')]//button[@role='menuitem']//span[contains(text(), "Date")]

Select a question of a select type
    click                   xpath=(//div[contains(@class, 'cdk-overlay-pane')]//button[@role='menuitem']//span[contains(text(), "Select")])[1]

Select a question of a rating type
    click                   xpath=//div[contains(@class, 'cdk-overlay-pane')]//button[@role='menuitem']//span[contains(text(), "Rating")]


Add a Date question
    [Arguments]    ${question_name}    ${question_type_name} 
    Fill Text    xpath=(//div[contains(@class, 'cdk-overlay-container')]//textarea[@placeholder='Type Question here'])[2]   ${question_name}
    click       xpath=(//div[contains(@class, 'cdk-overlay-container')]//mat-select[@role='combobox'])[3]
    click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//span[contains(text(), "Add custom field...")]
    Fill Text    xpath=//div[contains(@class, 'cdk-overlay-container')]//irms-input-error[@class="custom-input"]//input[@type="text"]      ${question_type_name}
    click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//mat-select[@id="type"]
    click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//div[@role="listbox"]//mat-option[@role="option"]//span[contains(text(),'Date')]
    click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//button//span[contains(text(),'Add')]

Add a Select question
    [Arguments]    ${question_name}    ${question_type_name}
    Fill Text    xpath=(//div[contains(@class, 'cdk-overlay-container')]//textarea[@placeholder='Type Question here'])[2]   ${question_name}
    click       xpath=(//div[contains(@class, 'cdk-overlay-container')]//mat-select[@role='combobox'])[3]
    click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//span[contains(text(), "Add custom field...")]
    Fill Text    xpath=//div[contains(@class, 'cdk-overlay-container')]//irms-input-error[@class="custom-input"]//input[@type="text"]     ${question_type_name}
    click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//mat-select[@id="type"]
    click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//div[@role="listbox"]//mat-option[@role="option"]//span[contains(text(),'Text')]
    click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//button//span[contains(text(),'Add')]
    
Add Option   
    [Arguments]      ${index}    ${option}
    Click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//mat-icon[contains(text(),'add_circle_outline')]
    Fill Text    xpath=(//div[contains(@class, 'cdk-overlay-pane')]//textarea[@placeholder="Type Option"])[${index}]    ${option}
    Click    xpath=(//div[contains(@class, 'cdk-overlay-pane')]//textarea[@placeholder="Type Option"])[${index}]

Add a Rating question
    [Arguments]    ${question_name}    ${question_type_name} 
    Fill Text    xpath=(//div[contains(@class, 'cdk-overlay-container')]//textarea[@placeholder='Type Question here'])[2]   ${question_name}
    click       xpath=(//div[contains(@class, 'cdk-overlay-container')]//mat-select[@role='combobox'])[3]
    click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//span[contains(text(), "Add custom field...")]
    Fill Text    xpath=//div[contains(@class, 'cdk-overlay-container')]//irms-input-error[@class="custom-input"]//input[@type="text"]     ${question_type_name}
    click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//mat-select[@id="type"]
    Get Element           xpath=//div[contains(@class, 'cdk-overlay')]//div[@role="listbox"]//mat-option[@role="option"]//span[contains(text(),'Rating')]
    click           xpath=//div[contains(@class, 'cdk-overlay')]//div[@role="listbox"]//mat-option[@role="option"]//span[contains(text(),'Rating')]
    click       xpath=//div[contains(@class, 'cdk-overlay-pane')]//button//span[contains(text(),'Add')]


Save form
    Click    xpath=//div[contains(@class, 'cdk-overlay-pane')]//button//span[contains(text(),'Save Form')]

Close form
    Click    xpath=//div[contains(@class, 'cdk-overlay-pane')]//button//span[contains(text(),'Close')]
