Feature: Login BO
  Login to MokaPOS BO

  Scenario: Login
    Given navigate backoffice
    Then input email and password
    When click button sign in
    And should see dashboard page
