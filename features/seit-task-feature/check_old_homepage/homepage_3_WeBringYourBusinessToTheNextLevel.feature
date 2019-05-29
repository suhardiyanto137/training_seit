@javascript
Feature: Check Container We Bring Your Business To The Next Level

  Background:
  Given I go to home page

    Scenario: Check UI Container
      Then I should see "We Bring Your Business To The Next Level" and "Moka adalah sistem kasir yang memakai teknologi sistem Cloud untuk bisnis kecil menengah, mulai dari butik baju, restoran, hingga pangkas rambut yang memiliki banyak cabang."

    Scenario: Check F&B Info
       Then I should see F&B image & information

    Scenario: Check F&B Video
       And click button video F&B
       Then I should see Moka Video

    Scenario: Check Service Business Info
       Then I should see Service Business image and information

    Scenario: Check Service Business Video
       And click button video Service Business
       Then I should see Moka Video

    Scenario: Check Retail Info
       Then I should see Retail image and information

    Scenario: Check Retail Video
       And click button video Retail
       Then I should see Moka Video
