*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Library     OperatingSystem
Resource   ../Common.robot

*** Variables ***
${uri_login}

*** Keywords ***
  
login
   [Arguments]     ${User_Email}    ${User_Password}
    Create Session    mysession    ${BASE_URI}
 
    ${body}      Create Dictionary     grant_type=password     client_id=client-spa    client_secret=secret     username=${User_Email}    password=${User_Password}     portal=admin
    ${header}    Create Dictionary     Content-Type=application/x-www-form-urlencoded
    ${Response}  Post Request    mysession    connect/token  data=${body}    headers=${header}
    [Return]   ${Response}
    
Get token 
    [Arguments]    ${resp}
    ${content_string}  Convert To String    ${resp.content}
     Should Contain     ${content_string}     access_token
     ${JSON_RESPONSE}    evaluate    json.loads('''${resp.content}''')    json
     ${result}=  Set Variable  ${JSON_RESPONSE['access_token']}
     ${Token}   Get Value From Json     ${JSON_RESPONSE}     $..access_token
     ${TOKEN_CONCATENTED_WITH_BEARER}    Catenate    Bearer ${result}
     [Return]    ${TOKEN_CONCATENTED_WITH_BEARER}
    
