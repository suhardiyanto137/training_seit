When(/^I access Library > Taxes$/) do
  access_tax
end

Then(/^I Create Tax (\d+) and (\d+)$/) do |arg1, arg2|
  param = {tax_name: "Tax #{arg1}", tax_amount: "#{arg2}"}
  create_tax_single_outlet(param)
end

Then(/^I should see (\d+) on tax list and count existing tax$/) do |arg1|
  @param = {tax_name: "Tax #{arg1}"}
  check_tax_list(@param)
end

Then(/^I clear tax with (\d+)$/) do |arg1|
  clear_tax(@param)
end
