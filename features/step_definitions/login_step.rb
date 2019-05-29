Given(/^navigate backoffice$/) do
  visit "/"
end

Then(/^input email and password$/) do
  fill_in "email", :with => "mimo4@mailnesia.com"
  fill_in "password", :with => "123456"
end

When(/^click button sign in$/) do
  find('.btn.btn-primary.btn-block.has-spinner').click
end

When(/^should see dashboard page$/) do
  page.should have_content('Dashboard')
end
