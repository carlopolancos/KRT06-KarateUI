Feature: Validating UI browser launch

    @tag1
    Scenario: Open google on the browser
        Given configure driver = { type: 'chrome', addOptions:["--remote-allow-origins=*"], port: 1234 }
#        Given configure driver = { type: 'safaridriver', target: null } //for mac
        And driver 'https://www.google.com'
        Then delay(2000)
        Then input("#APjFqb",'Carlo James Polancos')
        Then delay(2000)

    @tag2
    Scenario: Open saucedemo on the browser
        Given configure driver = { type: 'chrome', addOptions:["--remote-allow-origins=*"], port: 1234 }
        And driver 'https://www.saucedemo.com/'
        Then delay(2000)
        Then input("#user-name",'Carlo James Polancos')
        Then input("#password",'Carlo James Polancos')
        Then delay(2000)

    @tag3
    Scenario: Open saucedemo on the browser and click login using CSS selector
        And driver 'https://www.saucedemo.com/'
        Then input("//input[@placeholder='Username']",'standard_user')
        Then input("//input[@placeholder='Password']",'secret_sauce')
        Then click("input[data-test='login-button']")

    @tag3
    Scenario: Open saucedemo on the browser and click login using XPATH selector
        And driver 'https://www.saucedemo.com/'
        Then input("//input[@placeholder='Username']",'standard_user')
        Then input("//input[@placeholder='Password']",'secret_sauce')
        Then click("//input[@data-test='login-button']")

    @tag3
    Scenario: Open saucedemo on the browser and click login using default CSS selector
        And driver 'https://www.saucedemo.com/'
        Then input("//input[@placeholder='Username']",'standard_user')
        Then input("//input[@placeholder='Password']",'secret_sauce')
        Then click("#login-button")

    @tag4
    Scenario: Open google using its linkText
        And driver 'https://www.google.com/'
        #        Then click("{a}Images")
        #        Then click("{}Images")
        #        Then click("{^}Imag")
        #        Then click("{^a}Imag")
        Then click("{^a:1}Imag")