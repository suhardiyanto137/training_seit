Then(/^I should see "([^"]*)" and "([^"]*)"$/) do |arg1, arg2|
 @params = {content: arg1}
 expect_page_to_have_content(@params)
end

Then(/^make sure directed to register page with link "([^"]*)"$/) do |arg1|
 @params = {url: arg1}
 expect_page_to_have_url(@params)
end

Then(/^make sure directed to link "([^"]*)"$/) do |arg1|
 move_to_last_tab
 @params = {url: "#{arg1}"}
 expect_page_to_have_url(@params)
 sleep 2
 close_current_tab
 move_to_first_tab
 # expect(page).to have_link(href: "#{custom_url}")
end

Then(/^I should see link iTunes and App Store$/) do
 # App Store
 appstore = 'https://itunes.apple.com/us/app/moka-pos/id955811575'
 expect(page).to have_link(href: appstore)
 expect(page).to have_css("img[src*='https://www.mokapos.com/assets/home/app-store-button-normal-70281c796a7eeda72873141f0fd20377.svg']")
 # Play Store
 playstore = 'https://play.google.com/store/apps/details?id=com.mokapos.android'
 expect(page).to have_link(href: playstore)
 expect(page).to have_css("img[src*='https://www.mokapos.com/assets/home/google-play-button-normal-496a97affc51be1481290f76812f82d0.svg']")
end

Given(/^click link App Store$/) do
 sleep 3
 find(:css, ".social-store>li:nth-child(1)>a").click
 sleep 3
 wait_for_ajax
end

Given(/^click link Play Store$/) do
 sleep 3
 find(:css, ".social-store>li:nth-child(2)>a").click
 sleep 3
 wait_for_ajax
end

Then(/^I should see Moka App Store page$/) do
 move_to_last_tab
 expect(page).to have_css("section>div>div>picture") # Picture MOKA
 expect(page).to have_content("App Store")
 expect(page).to have_content("Moka POS")
end

Then(/^I should see Moka Play Store page$/) do
 move_to_last_tab
 expect(page).to have_content("Moka POS")
 expect(page).to have_title("Google Play")
 # Google Play Store Logo
 expect(page).to have_css("img[src*='https://www.gstatic.com/android/market_images/web/play_prism_hlock_2x.png']")
 # expect(page).to have_css("span:nth-child(1)>a[class][data-focusid]", :text => "Moka Teknolog Indonesia, PT")
end

Given(/^click button play "([^"]*)"$/) do |arg1|
 find("#watchnowindex").click
end

Then(/^I should see Moka Video$/) do
 sleep (15)
 find(:css, ".close").click
end
