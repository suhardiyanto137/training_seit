@javascript
Feature: check Get Free 14-day Trial of webpage

 Background:
 Given I go to home page

  Scenario: Container "Get Free 30-Day Trial"
  Then I should see "KLIK UNTUK 14 HARI TRIAL"
  Then I should see "Tanpa kontrak. Tanpa kartu kredit."

  Scenario: Container "Call Center"
  Then I should see "Hubungi :"
  Then I should see "1500970"

  Scenario: Container "TRIAL 14 DAY"
  When I try click link "COBA GRATIS SEKARANG"
  Then I should see "Start your free 14-day trial now."
  And make sure directed to register page with link "https://backoffice.mokapos.com/register"
