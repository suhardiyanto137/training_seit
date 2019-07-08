require 'uri'

Given(/^I navigate to backoffice$/) do
  login_backoffice
end


Then(/^I hit API using curl$/) do
  get_outlet_id

  param = {"id":"#{@outlet_id1}","name":"post","amount":"20"}
  grat_post = Curl.post("https://service-staging.mokapos.com/inventory/v1/gratuities", param.to_json) do |curl|
    curl.headers['Content-Type'] = 'application/json'
    curl.headers['User-Agent'] = 'capybara'
    curl.headers['Authorization'] = "#{@cookie[:value]}"
    curl.headers['OUTLET_ID'] = "#{@outlet_id1}"
  end
  binding.pry
  get_grat = JSON.parse(grat_post.body)
end
