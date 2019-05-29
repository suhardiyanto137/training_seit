When(/^I access Library > Gratuity$/) do
  visit "library/gratuity"
  top_loading_bar
  page.should have_content('Gratuity')
end

Then(/^I Create Gratuity (\d+) and (\d+)$/) do |arg1, arg2|
  click_button "Create Gratuity"
  # fill_in "name", :with => 'Tax '+arg1
  find("div:nth-child(1) > div > div > input").set 'Service '+arg1
  find("div:nth-child(3) > div > div > input").send_keys(arg2)
  find("span > button:nth-child(3)").click
  top_loading_bar
end

Then(/^I should see (\d+) on gratuity list and count existing gratuity$/) do |arg1|
  expect(page).to have_css("table > tbody > tr > td:nth-child(1)", text: "Service #{arg1}")
end

Then(/^I clear Gratuity with (\d+)$/) do |arg1|
  find("table > tbody > tr > td:nth-child(1)", :text => "Service #{arg1}").click
  top_loading_bar
  find(".fa.fa-trash").click
  find("div > button.btn.btn-danger").click
  top_loading_bar
  expect(page).to have_content("Gratuity successfully deleted.")
end

Then(/^I should not see (\d+) on Gratuity list$/) do |arg1|
  expect(page).to have_no_css("table > tbody > tr > td:nth-child(1)", text: "Service #{arg1}")
end
