@javascript
Feature: Check PIN Access in backoffice

  Scenario: Scenario Tick All setting PIN Access
    Given navigate backoffice
    Then input email and password
    When click button sign in
    And should see dashboard page
    When I access Employee > PIN Access
    Then I tick all the PIN Access
    And I Should see PIN Access all ticked

  Scenario: Scenario Untick All setting PIN access
    Give navigator backoffice
    Then input emial and password
    When click button sign in
    And should see dashboard page
    When I access Employee > PIN Access
    Then I untick all the PIN Access
    And I should see PIN Access all unticked
