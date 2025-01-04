*** Settings ***

###############  Libraries ################

Library     String
Library		Collections
Library     Browser




*** Variables ***

#####   Browser Configuration   #####
${Chromium_Browser}           chromium
${Firefox_Browser}            firefox

${HEADED}                     False
${HEADLESS}                   True

#####   URLS   #####
${Base_URL}           https://seeu-clientqa.takamulstg.com/
${Base_URI}           https://seeu-apiqa.takamulstg.com/

#####   Credentials   #####
${UserName}                      candidates@mailinator.com
${Password}                      Test@123






