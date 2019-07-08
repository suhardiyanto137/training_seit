@javascript
Feature: As SEIT candidate, I should Check Issue Refund button

Scenario: TCDP-86:05 Check Issue Refund button (Total Transaction is 0)
    Given I navigate to backoffice
    Then I hit Item Library API
    Then I hit Mobile Checkout API
    When user go to Reports > transaction
    Then open the transactions report by search receipt number
    Then If total transaction is 0, make sure Issue Refund button is not showing
