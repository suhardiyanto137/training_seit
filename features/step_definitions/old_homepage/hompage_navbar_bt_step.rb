Given(/^click link QUICK SERVICE RESTAUTANT$/) do
  find(:css, ".dropdown-menu:nth-child(2)>div>div:nth-child(2)>a:nth-child(1)").click
  wait_for_ajax
end

Given(/^click link COFFEE SHOP$/) do
  find(:css, ".dropdown-menu:nth-child(2)>div>div:nth-child(2)>a:nth-child(2)").click
  wait_for_ajax
end

Given(/^click link BARBERSHOP$/) do
  find(:css, ".dropdown-menu:nth-child(2)>div>div:nth-child(2)>a:nth-child(3)").click
  wait_for_ajax
end

Given(/^click link FULL SERVICE RESTAURANT$/) do
  find(:css, ".dropdown-menu:nth-child(2)>div>div:nth-child(3)>a:nth-child(1)").click
  wait_for_ajax
end

Given(/^click link RETAIL$/) do
  find(:css, ".dropdown-menu:nth-child(2)>div>div:nth-child(3)>a:nth-child(2)").click
  wait_for_ajax
end
