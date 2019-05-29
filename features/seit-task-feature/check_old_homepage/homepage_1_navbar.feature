@javascript
Feature: Check Moka Navbar

  Background:
  Given I go to home page

    Scenario: Make sure home page has Moka logo
      Then I should see moka logo

    Scenario: Make sure i can access Moka => About Page
      And click link "ABOUT"
      Then I should see "Tentang Moka POS"

    Scenario: Make sure i can access Moka => BUSINESS TYPES => QUICK SERVICE RESTAUTANT
      And click dropdown "BUSINESS TYPES"
      And click link QUICK SERVICE RESTAUTANT
      Then I should see "Moka untuk Bisnis Restoran Cepat Saji"

    Scenario: Make sure i can access Moka => BUSINESS TYPES =>
      And click dropdown "BUSINESS TYPES"
      And click link FULL SERVICE RESTAURANT
      Then I should see "Moka untuk Bisnis Restoran"

    Scenario: Make sure i can access Moka => BUSINESS TYPES =>
      And click dropdown "BUSINESS TYPES"
      And click link COFFEE SHOP
      Then I should see "Moka untuk Bisnis Kedai Kopi"

    Scenario: Make sure i can access Moka => BUSINESS TYPES =>
      And click dropdown "BUSINESS TYPES"
      And click link RETAIL
      Then I should see "Moka untuk Bisnis Ritel"

    Scenario: Make sure i can access Moka => BUSINESS TYPES =>
      And click dropdown "BUSINESS TYPES"
      And click link BARBERSHOP
      Then I should see "Moka untuk Barbershop"

    Scenario: Make sure i can access Moka => Features
      And click link "FEATURES"
      Then I should see "Simple, Yet Powerful"

    Scenario: Make sure i can access Moka => Hardware
      And click link "PRICING"
      Then I should see "Harga Moka POS"

    Scenario: Make sure i can access Moka => Login Page
      And click link "LOGIN"
      Then I should see "Sign In"

    Scenario: Make sure i can access Moka => Sign Up Page
      And click on SIGN UP NOW
      Then I should see "Start your free 14-day trial now."

    Scenario: Make sure i can access Moka => Moka Office Number
      And click Moka logo
      Then I should see "1500970"
