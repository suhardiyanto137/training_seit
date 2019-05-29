@javascript
Feature: As a SEIT-Candidate, I should automate register new account, create item and do checkout transaction

  Scenario: Register owner, then create item and make a checkout transaction
    Given i register account on mobile
    Then i access tempmail for verify email
    And make sure see Dashboard mokapos Page
    Given i login with new account
    Then i access Library to create item
    Then i make checkout transaction
    And check new account reporting and make sure transaction recorded on Report - Transaction
