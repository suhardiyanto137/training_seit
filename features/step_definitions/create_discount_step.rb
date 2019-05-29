When(/^I access Library > Discounts$/) do
  visit "/library/discounts"
  top_loading_bar
  page.should have_content('Discounts')
end

Then(/^I create discount with (\d+) and (\d+)$/) do |arg1, arg2|
  click_button 'Create Discount'
  top_loading_bar
  expect(page).to have_content("DISCOUNT INFORMATION")
  x = arg1.to_i
  # binding.pry
  if x%2 == 0
    fill_in "name", :with => "Disc% " + arg1
    find("div:nth-child(2) > div > div > input").send_keys(arg2)
  else
    # binding.pry
    page.execute_script("$('label > div').click();")
    fill_in "name", :with => "DiscRp " + arg1
    find("div:nth-child(2) > div > div > input").send_keys(arg2)
  end
  # find(" div.app-components-Fields-ReduxForm-SwitchField-__SwitchField___3fwg5").click
  # find("div.col-sm-8.hidden-xs.col-md-6.action-discounts > span > button").click
  # fill_in "name", :with => "Discount " + arg1
  # find(" div:nth-child(2) > div > div > input").send_keys(arg2)
  find("span > button:nth-child(3)").click
  top_loading_bar
  expect(page).to have_content("Discount successfully created.")
end

Then(/^I should see (\d+)$/) do |arg1|
  x = arg1.to_i
  if x%2 == 0
    expect(page).to have_css("table > tbody > tr > td:nth-child(1)", text: "Disc% #{arg1}")
    # expect(page).to have_css("table > tbody > tr > td:nth-child(2)", number_to_currency: "#{arg2}", unit: "Rp. ", seperator: "", delimiter: ".")
  else
    expect(page).to have_css("table > tbody > tr > td:nth-child(1)", text: "DiscRp #{arg1}")
    # expect(page).to have_css("table > tbody > tr > td:nth-child(2)", text: "#{arg2}")
  end

end
