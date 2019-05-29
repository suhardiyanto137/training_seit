@javascript
Feature: Check Create Modifier in backoffice

  Scenario Outline: Scenario Create Modifier
    Given navigate backoffice
    Then input email and password
    When click button sign in
    And should see dashboard page
    When I access Library > Modifier
    Then I create Modifier with modname and <optionname> and <optionprice>
    And I Should see modname on Modifier list

    Examples:
    | optionname | optionprice |
    |     1      |    15000    |
    |     2      |    30000    |
    |     3      |    40000    |
    |     4      |    50000    |
    |     5      |    60000    |
