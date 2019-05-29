@javascript
Feature: check content Footer - About

  Background:
  Given I go to home page

    Scenario: check Footer About in homepage
    Then I try access About on Footer
    And I should see title "Tentang Moka POS"
    Then I should see "Tentang Moka POS"
    And expect content directed to link "https://www.mokapos.com/about"

    Scenario: check Footer Privacy Policy in homepage
    Then I try access Privacy Policy on Footer
    And expect content directed to link "https://www.mokapos.com/privacy"
    Then I should see "Privacy Policy"

    Scenario: check Footer Terms of Service in homepage
    Then I try access Terms of Service on Footer
    And expect content directed to link "https://www.mokapos.com/terms"
    Then I should see "Terms of Service"

    Scenario: check Footer Career in homepage
    Then I try access Career on Footer
    And I should see title "Moka POS Careers, Job Hiring & Openings | Kalibrr"
    And expect content directed to link "https://www.kalibrr.com/c/moka-pos/jobs"
    Then I should see "Job Openings at Moka POS"

    Scenario: check Footer Moka Blog in homepage
    Then I try access Moka Blog on Footer
    And I should see title "Moka Blog - Empowering Merchants to Sell and Grow"
    And expect content directed to link "https://blog.mokapos.com/"
    Then I should see "Moka Blog IMG"
