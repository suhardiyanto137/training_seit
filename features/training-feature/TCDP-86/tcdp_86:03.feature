@javascript
Feature: As SEIT candidate, I should Check error label at email resend receipt

  Scenario: TCDP-86:03 Check error label at email resend receipt
    Given I navigate to backoffice
    Then I hit Item Library API
    Then I hit Mobile Checkout API
    When user go to Reports > transaction
    Then open the transactions report by search receipt number
    And user click Resend Receipt button
    Then make sure shows error label "The value is not a valid email address"
