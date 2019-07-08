@javascript
Feature: As SEIT candidate, I should hit mobile checkout API

  Scenario: Hit mobile checkout API
    Given I navigate to backoffice
    Then I hit Item Library API
    Then I hit Mobile Checkout API
