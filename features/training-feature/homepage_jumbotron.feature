@javascript
Feature:
    Check Moka POS Jumbotron

Background:
    Given I go to mokapos homepage

Scenario: Make sure opening text is correct
          Then I should see Atur kasir lebih mudah dengan Moka POS and Kami membantu bisnis Anda mempercepat proses penjualan dengan aplikasi kasir Moka
Scenario: Make sure Coba Gratis Sekarang to register
          When I click Coba Gratis Sekarang
          Then I should see register page
          And make sure page directed to "https://backoffice-staging.mokapos.com/register"
Scenario: Tonton Video Kami
          When I click play button Tonton Video Kami
          Then I should see Moka's video
