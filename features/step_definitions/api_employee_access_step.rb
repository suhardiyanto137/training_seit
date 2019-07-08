When(/^I hit Employee Access API$/) do
  visit "employees/role"
  binding.pry
  @randomize = Time.now.to_i
  page.should have_content('Employee Access')
  # Create role
  @cookie = get_me_the_cookie ('remember_token')
  param = {"name":"Test API Suha #{rand(1..399)}","permissions":[6,7,8,9,10,13]}
  role = Curl.post("https://service-staging.mokapos.com/account/v1/roles", param.to_json) do |http|
    http.headers['Content-Type'] = 'application/json'
    http.headers['User-Agent'] = 'capybara'
    http.headers['Authorization'] = "#{@cookie[:value]}"
  end

  @create_role = JSON.parse(role.body)
  @role_id = @create_role["id"]
  puts "I get role id with id:[#{@role_id}] first with Parsing reponse body"

end

Then(/^I hit Employee Slot API$/) do
  get_slot_id
  get_outlet_id
  puts "get slot id with id:[#{@get_slot_id}]"


  @param = {
    email:"suha#{@randomize}@mailinator.com",
    first_name:"Suha",
    last_name:"COK-#{@randomize}",
    phone:"84889489#{rand(100..9999)}",
    role_id:"#{@role_id}",
    description:"JANCOK TERSERAH GW COK!",
    "photo_url":"",
    "outlets":["#{@outlet_id1}","#{@outlet_id2}"],
    "slot_id":"#{@get_slot_id}",
    "auth_code":""
  }

  employee = Curl.post("https://service-staging.mokapos.com/account/v1/employees", @param.to_json) do |cek3|
    cek3.headers['Content-Type'] = 'application/json'
    cek3.headers['User-Agent'] = 'capybara'
    cek3.headers['Authorization'] = "#{@cookie[:value]}"
  end
  @employee = JSON.parse(employee.body)
  binding.pry
  expect(page).to have_css("table > tbody > tr > td:nth-child(1)", :text => "#{@param[:first_name]} #{@param[:last_name]}")
end
