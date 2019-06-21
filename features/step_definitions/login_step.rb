Given(/^navigate backoffice$/) do
  access_login_page
end

Then(/^input email and password$/) do
  login_page_fill_email
  login_page_fill_password
end

When(/^click button sign in$/) do
  login_page_click_login
end

When(/^should see dashboard page$/) do
  access_dashboard_page
end
