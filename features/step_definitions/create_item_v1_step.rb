When(/^I access Library > Item Library$/) do
  visit_library_item_library
end

Then(/^I Create Item (\d+) and (\d+)$/) do |arg1, arg2|
  click_button "Create Item"
  rand = rand(1..1000)
  item = "#{rand}"
  find("div:nth-child(3) > div > div > div > div > input").set "Item "+arg1+item
  find(".mk-grouped-input > div > div > input").set arg2
  @randomize = Time.now.to_i
  @SKU = "#{@randomize}"
  # fill_in "name", :with => @SKU
  find(".mk-grouped-input > div:nth-child(2) > input").send_keys(@SKU)
  find("span > button:nth-child(3)").click
  top_loading_bar
end

Then(/^I should see (\d+) on Item list and count existing Item$/) do |arg1|
  expect(page).to have_css("table > tbody > tr > td:nth-child(1)", text: "Item #{arg1}")
end
#
# Then(/^I clear Item with (\d+)$/) do |arg1|
#   find("table > tbody > tr > td:nth-child(1)", :text => "Item #{arg1}").click
#   top_loading_bar
#   find(".fa.fa-trash").click
#   find("div > button.btn.btn-danger").click
#   top_loading_bar
#   expect(page).to have_content("Item was successfully removed.=")
# end
#
# Then(/^I should not see (\d+) on Item list$/) do |arg1|
#   expect(page).to have_no_css("table > tbody > tr > td:nth-child(1)", text: "Service #{arg1}")
# end
