@javascript
Feature: check All In Pricing of webpage

  Background:
  Given I go to home page

    Scenario: Scenario All In Pricing
      Then I should see "Kami menawarkan kemudahan untuk Anda dalam segi harga tanpa kontrak dan support gratis untuk meningkatkan pengalaman berusaha Anda."

    Scenario: Check homepage > IMG PRICE/MONTH
      Then I should see IDR 249.000 per month image
      When I try click link "COBA GRATIS SEKARANG"
      Then I should see "Start your free 14-day trial now."
      And make sure directed to register page with link "https://backoffice.mokapos.com/register"

    Scenario: Check homepage > 3 row-details
      Then I should see No Contract "Image" and check text "No Contract"
      Then I should see Unlimited Products "Image" and check text "Unlimited Products"
      Then I should see Free Support "Image" and check text "Free Support"

    # Check homepage > Container slider (carousel)
      Then I should see "What Our Customers Say" and "Testimonials of our customers across Indonesia."

    # Check homepage > slider content
      Then I should see current slider content
      Then I should see slider button and try slider button

    Scenario: Check homepage > right slider
      And I click slider button > right arrow
      Then I should see next slider

    Scenario: Check homepage > left slider
      And I click slider button > left arrow
      Then I should see prev slider
      Then I should see "As Featured On" and Featuring Logos
