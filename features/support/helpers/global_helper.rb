module CustomWorld

  def top_loading_bar
    begin
      loading = page.execute_script 'return $("#wrapper > div:nth-child(1) > div:nth-child(1)").css("width");'
    end while loading == '1260px'
    begin
      loading = page.execute_script 'return $("#wrapper > div:nth-child(1) > div:nth-child(1)").css("width");'
    end while loading != '0px'
  end

  def move_to_last_tab
    tab = page.driver.browser.window_handles
    page.driver.browser.switch_to.window(tab.last)
  end

  def refresh_current_page
    page.evaluate_script 'window.location.reload()'
  end

  def move_to_first_tab
    tab = page.driver.browser.window_handles
    page.driver.browser.switch_to.window(tab.first)
  end

  def close_current_tab
    page.driver.browser.close
  end

  def login_backoffice
      access_login_page
      login_page_fill_email
      login_page_fill_password
      login_page_click_login
      access_dashboard_page
  end

  def loop_clean_tax
    x = 1
    begin
      length = page.evaluate_script("$('table > tbody > tr').length")
      find("table > tbody > tr:nth-child(#{x})").click
      top_loading_bar
      find(".fa.fa-trash").click
      find("div > button.btn.btn-danger").click
      top_loading_bar
      expect(page).to have_content("Taxes successfully deleted.")
    end while x < length
  end

  # def select_category(param)
  # select_category_css = "#react-select-15--list"
  #   select_category = find(:css, select_category_css).text
  #   select(select_category, :from => param)
  # end

  # def loop_create_modifier
  #   m = 1
  #   begin
  #     length = page.evaluate_scrip("$('table > tbody > tr').length")
  #     find("table > tbody > tr:nth-child(#{m}").click
  #   end while
  #   m < length
  #   end

  def get_outlet_id
    @cookie = get_me_the_cookie('remember_token')
      item_params = Curl.get("https://service-staging.mokapos.com/account/v1/profile") do |curl|
        curl.headers['Content-Type'] = 'application/json'
        curl.headers['Cookie'] = "remember_token=#{@cookie[:value]}"
        curl.headers['User-Agent'] = 'capybara'
      end
      @json = JSON.parse(item_params.body)
      @outlet_id1 = @json["outlets"][1]["id"]
      @outlet_id2 = @json["outlets"][2]["id"]
  end

  def get_role_id
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
  end

  def get_slot_id
    visit "employees/staff"
    page.should have_content('Employee Slots')

    # Get empty slots
    puts "Get slots existing then get empty slot for create new employee"
    slot = Curl.get("https://service-staging.mokapos.com/account/v1/slots?active=true&keyword=&includeMe=false") do |http|
      http.headers['Content-Type'] = 'application/json'
      http.headers['User-Agent'] = 'capybara'
      http.headers['Authorization'] = "#{@cookie[:value]}"
    end

    @slot = JSON.parse slot.body
    i = 0
    x = @slot[i].length
    check = x == 8
    while check != true do
      i += 1
      x = @slot[i].length
      check = x == 8
    end
    @get_slot_id = @slot[i]["id"]
  end

  # visit library page
  def visit_library_item_library
    visit "/library/list"
    top_loading_bar
    page.should have_content('Item Library')
  end

  def visit_report_transactions
    visit "/reports/transactions"
    top_loading_bar
    page.should have_content("Transactions")
  end
end

World(CustomWorld)
