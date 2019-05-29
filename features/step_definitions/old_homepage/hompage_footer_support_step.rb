Then(/^I try access Support Center on Footer$/) do
  find("div:nth-child(3) > div > ul > li:nth-child(1) > a").click
end

Then(/^I try access Video Tutorial on Footer$/) do
  find("div:nth-child(3) > div > ul > li:nth-child(2) > a").click
  move_to_last_tab
  # wathch 10 Second video on Youtube
  sleep 10
end

Then(/^I try access Knowledge Center on Footer$/) do
  find("div:nth-child(3) > div > ul > li:nth-child(3) > a").click
  move_to_last_tab
  sleep 1

end

Then(/^I try access Handbook on Footer$/) do
  sleep 3
  find("div:nth-child(3) > div > ul > li:nth-child(4) > a").click
  sleep 3
  move_to_last_tab
end

Then(/^I try access Mixpanel on Footer$/) do
  sleep 3
  find("div:nth-child(3) > div > ul > li:nth-child(5) > a").click
  sleep 3
  move_to_last_tab
end
