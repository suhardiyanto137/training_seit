Then(/^I delete tax with (\d+)$/) do |arg1|
  loop_clean_tax
end

Then(/^I should not see (\d+) on tax list$/) do |arg1|
  expect(page).to have_no_css("table > tbody > tr > td:nth-child(1)", text: "Tax #{arg1}")
end
