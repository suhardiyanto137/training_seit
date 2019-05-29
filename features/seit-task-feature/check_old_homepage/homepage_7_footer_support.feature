@javascript
Feature: check content Footer - Support

    Scenario: check Footer Support Center in homepage
    Given I go to home page
    Then I try access Support Center on Footer
    Then I should see "Butuh Bantuan?"
    And expect content directed to link "https://www.mokapos.com/support"

    Scenario: check Footer Video Tutorial in homepage
    Given I go to home page
    Then I try access Video Tutorial on Footer
    And I should see title "Moka POS - Aplikasi Kasir Point of Sale - YouTube"
    Then I should see "Moka, More Than Just Point of Sales"
    And expect content directed to link "https://www.youtube.com/channel/UCLj9DxsNDYb5ITZb4Phxmyg"

    Scenario: check Footer Knowledge Center in homepage
    Given I go to home page
    Then I try access Knowledge Center on Footer
    Then I should see "Moka Knowledge Center"
    And expect content directed to link "https://help.mokapos.com/hc/en-us"

    Scenario: check Footer Mixpanel in homepage
    Given I go to home page
    Then I try access Mixpanel on Footer
    And I should see title "Mixpanel | Product and User Analytics for Mobile, Web, and Beyond"
    Then I should see "CREATE PRODUCTS AND EXPERIENCES THAT PEOPLE LOVE"
    And expect content directed to link "https://mixpanel.com/?from=partner"

    Scenario: check Footer Handbook in homepage
    Given I go to home page
    Then I try access Handbook on Footer
    And I should see title "Moka Getting Started Guide [IND].pdf - Google Drive"
    Then I should see "Moka Getting Started Guide [IND].pdf"
    
