@javascript
Feature: As SEIT candidate, I should Check Textfield related customer email

  Scenario: TCDP-86:02 Check Textfield related customer email
    Given I navigate to backoffice
    Then I hit Item Library API
    Then I hit Mobile Checkout API
    When user go to Reports > transaction
    Then open the transactions report by search receipt number  
    And user click Resend Receipt button
    Then make sure the textfield email is filled with related customer's email
