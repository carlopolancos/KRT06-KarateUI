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

    @tag5
    Scenario: Wait for, new page
        Given driver 'https://login.salesforce.com/?locale=ap'
        #        And above("//label[@for='password']").find("input").input("carlo")
        #        And below("//label[@for='password']").find("input").input("carlo")
        And above("//label[@for='password']").input("carlo")
        And below("//label[@for='password']").input("carlo")
        And leftOf("//label[@for='rememberUn']").find("input").click()
        And click("{a}Try for Free")
        And waitFor("#onetrust-accept-btn-handler").click()
        And input("//input[@name='UserFirstName']", "carlo")

    @tag6
    Scenario: Browser navigation
        Given driver 'https://google.com'
        Then maximize()
        And minimize()
        And maximize()
        And fullscreen()
        And refresh()
        And reload()
        And click("{a}Images")
        And back()
        And forward()

    @tag7
    Scenario: Open google and print page title and url
        Given driver 'https://google.com'
        Then print driver.title
        And print driver.url
        And match driver.title == "Google"
        And match driver.url == "https://www.google.com/"

    @tag8
    Scenario: Open google and print driver dimensions
        Given driver 'https://google.com'
        And print driver.dimensions
        #        * driver.dimensions =
        #            """
        #            { x: 20, y: 20, width: 900, height: 600 }
        #            """
        Then print position("#APjFqb")

    @tag9
    Scenario: Hooks
        * print("This is before content")
        And configure afterScenario = function() { karate.log('After Scenario: Execution Completed') }
        And configure afterFeature = function() { karate.log('End of the feature file') }
        Given driver 'https://google.com

    @tag10
    Scenario: Screenshots
        * configure afterScenario =
            """
            function(){
                karate.log(karate.info);
                if(karate.info.errorMessage) {
                    var bytes = driver.screenshot(false);
                    var name = karate.info.scenarioName.replaceAll(' ', '_') + '.png';
                    karate.write(bytes, name);
                    karate.embed(bytes, name);
                }
            }
            """
        Given driver 'https://google.com'
        When input("#APjFqb", "carlo")
        #        Whole page screenshot
        Then screenshot()
        #        Locator screenshot
        Then screenshot("#APjFqb")

    @tag10
    Scenario: Screenshot on failure
        * configure afterScenario =
            """
            function(){
                karate.log(karate.info);
                if(karate.info.errorMessage) {
                    var bytes = driver.screenshot(false);
                    var name = karate.info.scenarioName.replaceAll(' ', '_') + '.png';
                    karate.write(bytes, name);
                    karate.embed(bytes, name);
                }
            }
            """
        Given driver 'https://google.com'
        When input("#APjFqbqeuqeu", "carlo")
        #        Whole page screenshot
        Then screenshot()
        #        Locator screenshot
        Then screenshot("#APjFqb")

    @tag11
    Scenario: Special keys, highlight, focus, submit vs click, clear
        Given driver 'https://login.salesforce.com/'
        #        When input("#username","carlo" + Key.ENTER)
        #        And input("#username","carlo" + Key.TAB)
        #        Then highlight("#username")
        #        And highlightAll("a")
        #        And focus("#password")

        When input("#username","carlo")
        #        Then clear("#username")
        And submit().click("#Login")

    @tag12
    Scenario: Handling dropdown pt1
        Given driver 'https://www.bing.com/account/general?ru=https%3a%2f%2fwww.bing.com%2f%3ftoWww%3d1%26redig%3d270EC26287DD4F4D99D66FF501D0BDAF&FORM=O2HV65'
        #0base, by index
        When select("#single_language", 1)
        #by exact text
        When select("#single_language", "{}Danish (Denmark)")
        #by partial text
        When select("#single_language", "{^}Danish")
        #by value
        When select("#single_language", "da-DK")

    @tag13
    Scenario: Handling dropdown pt2
        Given driver 'https://login.salesforce.com/'
        When click("#signup_link")
        And waitFor("#onetrust-accept-btn-handler").click()
        And input("//input[@name='UserFirstName']", "carlo")
        And input("//input[@name='UserLastName']", "polancos")
        And input("//input[@name='UserTitle']", "master")
        And input("//input[@name='UserEmail']", "sample@email.com")
        And input("//input[@name='UserPhone']", "0987654321")
        And select("//select[@name='CompanyEmployees']", "1 - 20 employees")
        And input("//input[@name='CompanyName']", "Master Co.")
        And select("//select[@name='CompanyCountry']", 5)
        And select("//select[@name='CompanyCountry']", "BS")
        And select("//select[@name='CompanyCountry']", "{}Qatar")
        And select("//select[@name='CompanyCountry']", "{^}Keeling")

    @tag14
    Scenario: Handling javascript alerts
        Given driver 'https://the-internet.herokuapp.com/javascript_alerts'
        When click("button[onclick='jsAlert()']")
        * print driver.dialogText
        Then match driver.dialogText == "I am a JS Alert"
        #accept alert
        And dialog(true)
        Then match text("#result") == "You successfully clicked an alert"

        When click("button[onclick='jsConfirm()']")
        * print driver.dialogText
        Then match driver.dialogText == "I am a JS Confirm"
        #accept alert
        And dialog(true)
        Then match text("#result") == "You clicked: Ok"

        When click("button[onclick='jsConfirm()']")
        * print driver.dialogText
        Then match driver.dialogText == "I am a JS Confirm"
        #accept alert
        And dialog(false)
        Then match text("#result") == "You clicked: Cancel"

        When click("button[onclick='jsPrompt()']")
        * print driver.dialogText
        Then match driver.dialogText == "I am a JS prompt"
        #accept alert
        And dialog(true, "carlo polancos")
        Then match text("#result") == "carlo polancos"

    @tag15
    Scenario: Handling iframes
        Given driver 'https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_alert'
        #When switch frame(null) to return to root

        #When switchFrame(0) (0base) switches to the first frame
        When switchFrame("#iframeResult")
        #Any future actions will be executed inside the specified frame
        And click("body > button")
        Then match driver.dialogText == "Hello! I am an alert box!"

    @tag15
    Scenario: Handling iframes
        Given driver 'https://jqueryui.com/dialog/'
        When switchFrame(0)
        And click("span[class='ui-button-icon ui-icon ui-icon-closethick']")

    @tag16
    Scenario: Handling get text
        Given driver 'https://the-internet.herokuapp.com/javascript_alerts'
        When click("button[onclick='jsAlert()']")
        * print driver.dialogText
        Then match driver.dialogText == "I am a JS Alert"
        #accept alert
        And dialog(true)
        Then match text("#result") == "You successfully clicked an alert"
        * print("carlo " + text("#result"))

    @tag17
    Scenario: Handling get text and attribute
        Given driver 'https://google.com'
        * def name = "carlo polancos"
        When input("#APjFqb",name)
        * waitUntil(function(){ return value('#APjFqb') == name })
        * print 'Current Value:', value("#APjFqb")
        * print 'Class Attribute:', attribute("#APjFqb", "class")

    @tag18
    Scenario: Handling window switching
        Given driver 'https://homeloans.hdfc.bank.in/'
        When click("{a:1}Read More")
        And switchPage("Home Loan Benefits : Benefits of Housing Loan to Apply at Present Time")
        And print("carlo " + text("#lp-hover"))

        And switchPage("Housing Finance | Home Finance Company | HDFC Bank Ltd")
        And click("a[title='Blogs']")
        And waitFor("a[title='Deposits']")
        Then match driver.title == "HDFC Bank Ltd | Blog"
        And click("{}Deposits")

    @tag19
        #website not working
    Scenario: File upload
        Given driver 'https://the-internet.herokuapp.com/upload'
        When driver.inputFile("#file-upload", "C:/Users/carlo.polancos/Downloads/swagger-logo.png")
        And delay(2000)
        And click("#file-submit")
        And delay(2000)
        Then match text("#uploaded-files") contains "swagger-logo.png"

    @tag20
    Scenario: Page scrolling
        Given driver 'https://homeloans.hdfc.bank.in/'
        When scroll("a[href='https://www.hdfc.bank.in/branch-locator']")

    @tag21
    Scenario: Rerun a failed scenario
        * configure afterScenario =
            """
            function(){
                karate.log(karate.info);
                if(karate.info.errorMessage) {
                    var bytes = driver.screenshot(false);
                    var name = karate.info.scenarioName.replaceAll(' ', '_') + '.png';
                    karate.write(bytes, name);
                    karate.embed(bytes, name);
                    karate.call("DemoUtil2.feature");
                }
            }
            """
        Given driver 'https://google.com'
        When input("#APjFqbqeuqeu", "carlo")
        #        Whole page screenshot
        Then screenshot()
    #        Locator screenshot
    #        Then screenshot("#APjFqb")

    @tag22
    Scenario: Compare images
        Given def latestImgBytes = karate.readAsBytes('swagger-logo.png')
        When compareImage { baseline: 'classpath:examples/users/swagger-logo.png', latest: #(latestImgBytes) }