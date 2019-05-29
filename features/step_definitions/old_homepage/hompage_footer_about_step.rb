Then(/^I try access About on Footer$/) do
  find("div.col-md-7.col-lg-7.visible-md.visible-lg > div:nth-child(1) > div > ul > li:nth-child(1) > a").click
end

Then(/^expect content directed to link "([^"]*)"$/) do |arg1|
  @params = {url: arg1}
  expect_page_to_have_url(@params)
end

Then(/^I should see title "([^"]*)"$/) do |arg1|
  expect(page).to have_title(arg1)
end

Then(/^I try access Privacy Policy on Footer$/) do
  find("div.col-md-7.col-lg-7.visible-md.visible-lg > div:nth-child(1) > div > ul > li:nth-child(2) > a").click
end

Then(/^I try access Terms of Service on Footer$/) do
  find("div.col-md-7.col-lg-7.visible-md.visible-lg > div:nth-child(1) > div > ul > li:nth-child(3) > a").click
end

Then(/^I try access Career on Footer$/) do
  find("div.col-md-7.col-lg-7.visible-md.visible-lg > div:nth-child(1) > div > ul > li:nth-child(4) > a").click
end

Then(/^I try access Moka Blog on Footer$/) do
  find("div.col-md-7.col-lg-7.visible-md.visible-lg > div:nth-child(1) > div > ul > li:nth-child(5) > a").click
end
