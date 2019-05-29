@javascript
Feature: Check Jumbotron

  Background:
  Given I go to home page

    Scenario: Jumbotron => Text
      Then I should see "Selling Made Easy" and "Gunakan Aplikasi Kasir MOKA di perangkat Android & IOS Anda hanya dalam hitungan menit dan jalankan bisnis Anda dari mana saja."

    Scenario: Click TRIAL 14 DAY
      When I try click link "COBA GRATIS SEKARANG"
      Then I should see "Start your free 14-day trial now."
      And make sure directed to register page with link "https://backoffice.mokapos.com/register"

    Scenario: Expect link Moka App Store & Play Store
      Then I should see link iTunes and App Store

    # Moka => App Store
      And click link App Store
      Then I should see Moka App Store page
      And make sure directed to link "https://itunes.apple.com/us/app/moka-pos/id955811575"

    # Moka => Play Store
      And click link Play Store
      Then I should see Moka Play Store page
      And make sure directed to link "https://play.google.com/store/apps/details?id=com.mokapos.android"

    Scenario: Try to play video
      And click button play "button play"
      Then I should see Moka Video
