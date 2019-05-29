Given(/^I go to home page$/) do
  visit 'https://mokapos.com'
  wait_for_ajax
end

Then(/^I should see moka logo$/) do
  @params = {css: "img[src*='https://www.mokapos.com/assets/home/logo-moka-f45408be45f25e06608a8da66ee1e44f.svg']"}
  expect_page_to_have_css(@params)
end

Given(/^click link "([^"]*)"$/) do |arg1|
  click_link (arg1)
  wait_for_ajax
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  @params = {css: arg1}
  expect_page_to_have_content(@params)
end

Given(/^click on SIGN UP NOW$/) do
  find("#signup-menu").click
  wait_for_ajax
end

Given(/^click Moka logo$/) do
  find(".logo-moka-header").click
  wait_for_ajax
end

# Dropdown for BUSINESS TYPES
Given(/^click dropdown "([^"]*)"$/) do |arg1|
  find("#menu2").click
  sleep 1
end
