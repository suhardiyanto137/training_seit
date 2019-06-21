@javascript
Feature: As SEIT candidate, I should hit Employees API using Curl

  Scenario:  Employee
    Given I navigate to backoffice
    When I hit Employee Access API
    Then I hit Employee Slot API
