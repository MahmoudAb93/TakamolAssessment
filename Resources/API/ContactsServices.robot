*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Library     OperatingSystem
Resource   ../Common.robot
Resource    ./LoginService.robot

*** Variables ***
${uri_login}

*** Keywords ***
  
Add contact list
   [Arguments]     ${Token}    ${Group_Name}
    Create Session    mysession    ${BASE_URI}
 
    ${body}      Create Dictionary     name=${Group_Name}     color=#FF1744
    ${header}    Create Dictionary     Content-Type=application/json     Authorization=${Token}
    ${Response}  Post Request    mysession    api/contact/contact-list   data=${body}    headers=${header}
    [Return]   ${Response}
    
Get list ID
    [Arguments]    ${resp}
    ${ID}  Convert To String    ${resp.content}
    ${ID}   Remove String     ${ID}    "    "
     [Return]    ${ID}

Add list ID
   [Arguments]     ${Token}    ${ID}
    Create Session    mysession    ${BASE_URI}

    ${body}      Create Dictionary     id=${ID}     
    ${header}    Create Dictionary     Content-Type=application/json     Authorization=${Token}
    ${Response}  Post Request    mysession    api/contact/list-name   data=${body}    headers=${header}
    [Return]   ${Response}
    
