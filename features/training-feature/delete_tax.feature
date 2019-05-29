@javascript
Feature: Check delete tax in backoffice

  Scenario Outline: Scenario Delete Tax
    Given navigate backoffice
    Then input email and password
    When click button sign in
    And should see dashboard page
    When I access Library > Taxes
    Then I delete tax with <name>
    And I should not see <name> on tax list
