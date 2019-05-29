@javascript
Feature: Check Discount on Backoffice

  Scenario Outline: Scenario Create Discount
    Given navigate backoffice
    Then input email and password
    When click button sign in
    And should see dashboard page
    When I access Library > Discounts
    Then I create discount with <name> and <amount>
    And I should see <name>

    Examples:
    | name | amount |
    |   1  | 10000  |
    |   2  |  20    |
    |   3  | 15000  |
    |   4  |  50    |
    |   5  | 30000  |
