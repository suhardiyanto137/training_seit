@javascript
Feature: As SEIT candidate, I should check Textfield email in Resend Receipt

  Scenario: TCDP-86:01 Check Textfield email
    Given I navigate to backoffice
    Then I hit Item Library API
    Then I hit Mobile Checkout API
    When user go to Reports > transaction
    Then open the transactions report by search receipt number
    And user click Resend Receipt button
    Then user should see "Email" textfield must be empty
