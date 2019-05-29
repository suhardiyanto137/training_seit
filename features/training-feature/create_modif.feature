@javascript
Feature: Check Create Modifiers in backoffice

  Scenario: Scenario Create Modifiers
    Given navigate backoffice
    Then input email and password
    When click button sign in
    And should see dashboard page
    When I access Library > Modifier
    Then I create Modifier with modname
    And I Should see modname and make sure modifier created
