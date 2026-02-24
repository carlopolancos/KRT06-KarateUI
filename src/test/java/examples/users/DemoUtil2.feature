Feature: Validate application behavior with various locators

    @tag5
    Scenario:
        Given driver 'https://login.salesforce.com/?locale=ap'
        And above("//label[@for='password']").find("input").input("carlo")