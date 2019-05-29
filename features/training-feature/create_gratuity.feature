@javascript
Feature: Check create gratuity in backoffice

  Scenario Outline: Create Gratuity
    Given navigate backoffice
    Then input email and password
    When click button sign in
    And should see dashboard page
    When I access Library > Gratuity
    Then I Create Gratuity <name> and <amount>
    And I should see <name> on gratuity list and count existing gratuity

    Examples:
    | name | amount |
    |   1  |    10  |
    |   2  |    15  |
    |   3  |    20  |
    |   4  |    25  |
    |   5  |    30  |

    Scenario Outline: Scenario Clear Gratuity
      Given navigate backoffice
      Then input email and password
      When click button sign in
      And should see dashboard page
      When I access Library > Gratuity
      Then I clear Gratuity with <name>
      And I should not see <name> on Gratuity list

      Examples:
      | name |
      |   1  |
      |   2  |
      |   3  |
      |   4  |
      |   5  |
