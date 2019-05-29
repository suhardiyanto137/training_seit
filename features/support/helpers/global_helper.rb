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

  def loop_clean_tax
    x = 1
    begin
      length = page.evaluate_script("$('table > tbody > tr').length")
      find("table > tbody > tr:nth-child(#{x})").click
      top_loading_bar
      find(".fa.fa-trash").click
      find("div > button.btn.btn-danger").click
      top_loading_bar
      expect(page).to have_content("Gratuity successfully deleted.")
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

  def get_outlet_info
    @cookie = get_me_the_cookie('remember_token')
      item_params = Curl.post("https://dev-old.mokapos.com/api/v1/outlets") do |curl|
        curl.headers['Content-Type'] = 'application/json'
        curl.headers['Cookie'] = "remember_token=#{@cookie[:value]}"
        curl.headers['User-Agent'] = 'capybara'
      end
      json = JSON.parse(item_params.body)
  end

end

World(CustomWorld)
