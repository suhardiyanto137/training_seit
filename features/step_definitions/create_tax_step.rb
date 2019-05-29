When(/^I access Library > Taxes$/) do
  visit "/library/taxes"
  top_loading_bar
  page.should have_content('Taxes')
end

Then(/^I Create Tax (\d+) and (\d+)$/) do |arg1, arg2|
  click_button "Create Tax"
  fill_in "name", :with => 'Tax '+arg1
  find("div:nth-child(2) > div > div > input").send_keys(arg2)
  find("span > button:nth-child(3)").click
  top_loading_bar
end

Then(/^I should see (\d+) on tax list and count existing tax$/) do |arg1|
  expect(page).to have_css("table > tbody > tr > td:nth-child(1)", text: "Tax #{arg1}")
end

Then(/^I clear tax with (\d+)$/) do |arg1|
  find("table > tbody > tr > td:nth-child(1)", :text => "Tax #{arg1}").click
  top_loading_bar
  find(".fa.fa-trash").click
  find("div > button.btn.btn-danger").click
  top_loading_bar
  expect(page).to have_content("Taxes successfully deleted.")
end
