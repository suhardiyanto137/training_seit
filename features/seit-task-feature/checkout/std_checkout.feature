@javascript
Feature: As a SEIT-Candidate, i should create automation for Checkout and Check report Transaction

  Scenario: Create checkout using curl and check report
    Given i navigate backoffice
    Then i access Library to create item
    Then i make checkout transaction
    And check reporting and make sure transaction recorded on Report - Transaction
    Then i delete created items
