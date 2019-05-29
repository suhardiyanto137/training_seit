@javascript
Feature: Check create tax in backoffice

  Scenario Outline: Create Tax
    Given navigate backoffice
    Then input email and password
    When click button sign in
    And should see dashboard page
    When I access Library > Taxes
    Then I Create Tax <name> and <amount>
    And I should see <name> on tax list and count existing tax

    Examples:
    | name | amount |
    |   1  |    10  |
    |   2  |    15  |
    |   3  |    20  |
    |   4  |    25  |
    |   5  |    30  |


    Scenario Outline: Scenario Clear Tax
      Given navigate backoffice
      Then input email and password
      When click button sign in
      And should see dashboard page
      When I access Library > Taxes
      Then I clear tax with <name>
      And I should not see <name> on tax list

      Examples:
      | name |
      |   5  |
      |   2  |
      |   1  |
      |   4  |
      |   3  |
