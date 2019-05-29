When(/^I access EMPLOYEE > PIN Access$/) do
  visit "/employees/pin"
  top_loading_bar
  page.should have_content('PIN Access')
end

Then(/^I tick all the PIN Access$/) do
  x = 4
  begin
    length = page.evaluate_script("$('.checkbox.checkbox-primary').length")
    evaluate_script("$('div:nth-child(#{x}) > div > div.col-md-1 > div > div > input').click()")
    x += 1
  end while x < length+3
  click_button'Save'
  top_loading_bar
  expect(page).to have_content("Permission is successfully updated.")
end

Then(/^I Should see PIN Access all ticked$/) do
expect(page).to have_css()
end
