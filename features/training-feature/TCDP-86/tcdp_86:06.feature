@javascript
Feature: As SEIT candidate, I should Click on Issue Refund button

Scenario: TCDP-86:06 Click on Issue Refund button
    Given I navigate to backoffice
    Then I hit Item Library API
    Then I hit Mobile Checkout API
    When user go to Reports > transaction
    Then open the transactions report by search receipt number
    And user click Issue Refund button
    Then make sure shows "Issue Refund" dialog and the content shows properly
