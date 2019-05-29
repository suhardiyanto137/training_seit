When(/^I access Library > Modifier$/) do
  visit "/library/modifier"
  top_loading_bar
  page.should have_content('Modifiers')
end

Then(/^I create Modifier with modname and (\d+) and (\d+)$/) do |arg1, arg2|
  click_button "Create Modifier"
  fill_in "name", :with => "Test Mod - #{Time.now.to_i}"
  find("button.btn.btn-block").click

  x = 2
  while x < 7
  length = page.evaluate_script("$('div:nth-child(#{x}) > div.form-group.col-sm-6 > div > input').length")
  find("div.fade.in.modal > div > div > div > div > div > button").click
  find("div:nth-child(#{x}) > div.form-group.col-sm-6 > div > input").send_keys(arg1)
  find("div:nth-child(#{x}) > div.form-group.col-sm-5 > div > input").send_keys(arg2)
  x += 1
end
  find("div.modal-footer > span.pull-right").click
  click_button "Save"
end

Then(/^I Should see modname on Modifier list$/) do
  expect(page).to have_content("Modifier successfully created.")
  top_loading_bar
  click_button "Cancel"
end

# buat yang create modif.feature
Then(/^I create Modifier with modname$/) do
  
  click_button "Create Modifier"
  @randomize = Time.now.to_i
  @modname = "TestMod-#{@randomize}"
  fill_in "name", :with => @modname
  find("button.btn.btn-block").click
  x = 2
  y = 1
  while y < 6
    find("div.fade.in.modal > div > div > div > div > div > button").click
    find("div:nth-child(#{x}) > div.form-group.col-sm-6 > div > input").send_keys("Mod-#{y} #{@randomize}")
    @price = rand(1000..100000)
    find("div:nth-child(#{x}) > div.form-group.col-sm-5 > div > input").send_keys(@price)
    y += 1
    x += 1
  end
  find("div.modal-footer > span.pull-right").click
  click_button "Save"
end

Then(/^I Should see modname and make sure modifier created$/) do
  expect(page).to have_content("Modifier successfully created.")
  top_loading_bar
  click_button "Cancel"
  expect(page).to have_content(@modname)
end
