@javascript
Feature: Check create item in backoffice

  Scenario Outline: Create Item
    Given navigate backoffice
    Then input email and password
    When click button sign in
    And should see dashboard page
    When I access Library > Item Library
    Then I Create Item <name> and <price>
    And I should see <name> on Item list and count existing Item

    Examples:
    | name |    price  |
    |   1  |    10000  |
    |   2  |    15000  |
    |   3  |    20000  |
    |   4  |    25000  |
    |   5  |    30000  |

    Scenario Outline: Scenario Clear Item
      Given navigate backoffice
      Then input email and password
      When click button sign in
      And should see dashboard page
      When I access Library > Item
      Then I clear Item with <name>
      And I should not see <name> on Item list

      Examples:
      | name |
      |   5  |
      |   2  |
      |   1  |
      |   4  |
      |   3  |
