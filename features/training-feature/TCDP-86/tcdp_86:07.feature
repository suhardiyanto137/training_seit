@javascript
Feature: As SEIT candidate, I should Check Issue Refund button (Full Refund)

  Scenario: TCDP-86:07 Check Issue Refund button (Full Refund)
    Given I navigate to backoffice
    Then I hit Item Library API
    Then I hit Mobile Checkout API
    When user go to Reports > transaction
    Then open the transactions report by search receipt number
    Then If transaction is fully refunded, make sure Issue Refund button is not showing
