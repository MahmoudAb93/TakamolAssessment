# Takamul Assessment

- This robot framework project runs with playwright (browser-Library) and request-library(restAPIS)
In order to run the project you can either run the files with ".robot" extension in the "Tests folder"
 or run the following commands in the terminal: 

- Run All Test Cases " py -m robot -d Results      -i       Test        Tests"
- Run All UI Test Cases " py -m robot -d Results      -i       UI        Tests"
- Run All API Test Cases " py -m robot -d Results      -i       API        Tests"
- Run All Happy scenario Test Cases " py -m robot -d Results      -i       Happy        Tests"
- Run All Negative scenario Test Cases " py -m robot -d Results      -i       Negative        Tests"
- Run All Test Cases related to public forms " py -m robot -d Results      -i       PublicForm        Tests"
- Run All Test Cases related to contacts " py -m robot -d Results      -i       Contacts        Tests"
- Run All Test Cases related to Contact Group " py -m robot -d Results      -i       ContactGroup        Tests"
- Run All Test Cases related to ContactServices " py -m robot -d Results      -i       ContactServices        Tests"
- Run All Test Cases related to LoginService " py -m robot -d Results      -i       LoginService        Tests"

- To view the reports after each run open the auto-generated file "report.html" in any browser
## Author

- Mahmoud Attia

## Software Requirements

- Download python v3.31 from https://www.python.org/downloads/
- Download pycharm ide
- Download Hyper Framework Support plugin on pycharm
- Download node js from https://nodejs.org/en
- Install "npm install playwright" on cmd
- Install "pip install robotframework" on cmd
- Install "pip install -U robotframework-browser" on cmd
- Install "pip install robotframework-requests"   on cmd
- Install "py -m Browser.entry init" on cmd
