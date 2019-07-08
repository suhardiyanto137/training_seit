When(/^user go to Reports > transaction$/) do
  visit_report_transactions
  find("#dropdown-box-calendar >div > div > button").click
  find('button', text:'Today').click
  top_loading_bar
end

Then(/^open the transactions report by search receipt number$/) do
  fill_in"Receipt number", with: "#{@receipt_no}"
  find("div:nth-child(2)> div:nth-child(2) > div > table > tbody > tr > td:nth-child(1)").click
end

Then(/^user click Resend Receipt button$/) do
  click_button"Resend Receipt"
end

Then(/^user click Issue Refund button$/) do
  click_button"Issue Refund"
end

Then(/^user should see "([^"]*)" textfield must be empty$/) do |par|
  page.should have_field("#{par}", with: '')
  click_button"Cancel"
end

Then(/^make sure the textfield email is filled with related customer's email$/) do
  customer_email = expect(find_field('Email').value).target
  if customer_email == "#{@cust_email}"
    find("span > button:nth-child(2)").click
    expect(page).to have_content("#{@sent}")
    find('button', text: "Done").click
  else
    find("span > button:nth-child(1)").click
    find('button', text: "Done").click
  end
end

Then(/^make sure shows error label "([^"]*)"$/) do |arg1|
  check_error = Time.now.to_i
  fill_in"Email", with: check_error
  page.should have_content("#{arg1}")
end

Then(/^make sure show message "([^"]*)"$/) do |arg1|
  @sent = ("#{arg1}")
  email = "suha_#{rand(11..137)}@mailinator.com"
  fill_in"Email", with: email
  click_button"Send"
  page.should have_content("#{@sent}")
end

Then(/^If total transaction is (\d+), make sure Issue Refund button is not showing$/) do |arg1|
  page.should have_no_content"Issue Refund"
end

Then(/^make sure shows "([^"]*)" dialog and the content shows properly$/) do |arg1|
  expect(page).to have_content"Issue Refund"
  expect(page).to have_css("div.app-components-receipt-transactions-InfoBox-__InfoBox___2crGL > div.pull-right", text: "#{@receipt_no}")
  click_button"Cancel"
end

Then(/^If transaction is fully refunded, make sure Issue Refund button is not showing$/) do
  click_button"Issue Refund"
  select 'Cancelled Order', from: "div:nth-child(4) > div > select"
  click_button"Issue Refund"
  fill_in"Receipt number", with: "#{@receipt_no}"
  find("div:nth-child(2)> div:nth-child(2) > div > table > tbody > tr > td:nth-child(1)").click
  page.should have_no_content"Issue Refund"
end
