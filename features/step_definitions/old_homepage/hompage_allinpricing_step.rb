Then(/^I should see IDR (\d+)\.(\d+) per month image$/) do |arg1, arg2|
 expect(page).to have_css("img[src*='https://s3-ap-southeast-1.amazonaws.com/image.mokapos.com/growth/price-image/pricing.svg']")
end

When(/^I try click link "([^"]*)"$/) do |arg1|
  find(:css, ".box-btn-free-trial.visible-md.visible-lg>a[href]").click
end


Then(/^I should see No Contract "([^"]*)" and check text "([^"]*)"$/) do |arg1, arg2|
  expect(page).to have_css("img[src*='https://www.mokapos.com/assets/home/no-contract-b9ada0ea6e75a8839e7c9c2ef2ac084c.png']") and expect(page).to have_css(".row.details-pricing>div:nth-child(1)", text: arg2)
end

Then(/^I should see Unlimited Products "([^"]*)" and check text "([^"]*)"$/) do |arg1, arg2|
  expect(page).to have_css("img[src*='https://www.mokapos.com/assets/home/unlimited-product-b7448bec1b4ec225ceb5342f87dd69ce.png']") and expect(page).to have_css(".row.details-pricing>div:nth-child(2)", text: arg2)
end

Then(/^I should see Free Support "([^"]*)" and check text "([^"]*)"$/) do |arg1, arg2|
  expect(page).to have_css("img[src*='https://www.mokapos.com/assets/home/free-support-0eb863947e8c4eef09b79697ce5cd775.png']") and expect(page).to have_css(".row.details-pricing>div:nth-child(3)", text: arg2)
end

Then(/^I should see slider button and try slider button$/) do
  right = expect(page).to have_css(".right.carousel-control")
  left = expect(page).to have_css(".left.carousel-control")
  if right = true && left == true
     puts "Slider Button Available"
  else
     puts "WHERE IS SLIDER BUTTON"
  end
  4.times do
     find(".right.carousel-control").click
     wait_for_ajax
  end
  4.times do
     find(".left.carousel-control").click
     wait_for_ajax
  end
end

Then(/^I should see current slider content$/) do
  expect(page).to have_content("\"Moka POS simplify operational and inventory and easy to bring along\"") and expect(page).to have_content("Chief Barbershop • Doni (Supervisor)")
end

Given(/^I click slider button > right arrow$/) do
  find(".right.carousel-control").click
  wait_for_ajax
end

Then(/^I should see next slider$/) do
  expect(page).to have_content("\"Fantastic application. So convenient and simple\"") and expect(page).to have_content("Head&Brew • Rachmat (Owner)")
end

Given(/^I click slider button > left arrow$/) do
  find(".left.carousel-control").click
  wait_for_ajax
end

Then(/^I should see prev slider$/) do
  expect(page).to have_content("\"MOKAPOS is a really helpful apps. It help us to monitor all of our counters across Indonesia in just a few clicks. It is really a great apps!!\"") and expect(page).to have_content("Hi Fries ( F&B Business)")
end

Then(/^I should see "([^"]*)" and Featuring Logos$/) do |arg1|
  expect(page).to have_content(arg1)
  expect(page).to have_css("img[src*='https://www.mokapos.com/assets/home/techinasia-logo-ad348b5df21fc1524601c80e2662284c.png']")
  expect(page).to have_css("img[src*='https://www.mokapos.com/assets/home/cnn-logo-8cd5f4fd4d1fbe0f29ee8f07c97ef523.png']")
  expect(page).to have_css("img[src*='https://www.mokapos.com/assets/home/bloomberg-logo-6f10f396868a4cd5b56a39ab918feba3.png']")
  expect(page).to have_css("img[src*='https://www.mokapos.com/assets/home/dailysocial-d15e50735f791faf08eadf4511fc3933.png']")
  expect(page).to have_css("img[src*='https://www.mokapos.com/assets/home/makemac-logo-7f3e9646b5e1bae835595b2193029295.png']")
  expect(page).to have_css("img[src*='https://www.mokapos.com/assets/home/businessweek-logo-e9988dac61df11d33857b870b55df2f0.png']")
end
