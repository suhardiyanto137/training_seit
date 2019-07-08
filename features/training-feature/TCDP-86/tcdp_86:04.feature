@javascript
Feature: As SEIT candidate, I should Check valid email format sent

Scenario: TCDP-86:04 Check valid email format sent
    Given I navigate to backoffice
    Then I hit Item Library API
    Then I hit Mobile Checkout API
    When user go to Reports > transaction
    Then open the transactions report by search receipt number
    And user click Resend Receipt button
    Then make sure show message "Email has been sent"
