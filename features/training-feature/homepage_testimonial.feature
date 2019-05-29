@javascript
Feature:
    Check Moka POS Testimonial

Background:
    Given I go to mokapos homepage

Scenario: Make sure testimonial text is correct
          Then I should see Dipercaya lebih dari 12,000 pebisnis di seluruh Indonesia
Scenario: Check Testimonial video
          When I click play button at one of testimonials
          Then I should see testimonial video
Scenario: Check mokapos > right slide
          When I click carousel button > next arrow
          Then I should see next slide
Scenario: Check mokapos > left slide
          When I click carousel button > prev arrow
          Then I should see prev slide
