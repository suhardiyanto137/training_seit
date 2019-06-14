require 'cucumber/rails'
require 'capybara/rspec'
require 'rspec/core'
require 'uri'
require 'capybara/poltergeist'

Dotenv::Railtie.load

platform = ENV['PLATFORM']
platform_version = ENV['PLATFORM_VERSION']
browser_name = ENV['BROWSER']
browser_version = ENV['BROWSER_VERSION']
browser_saucelabs = ENV['BROWSER_SAUCE']
resolution1 = ENV['RESOLUTION1']
resolution2 = ENV['RESOLUTION2']
# Set resoultion for saucelabs
resolution = ENV['SAUCE_RESOLUTION']

browser_name = case ENV["BROWSER"]
                when 'chrome'
                  :selenium_chrome
                when 'firefox'
                  :selenium
                when 'sauce'
                  :saucelabs
                end

Capybara.default_driver = browser_name
Capybara.javascript_driver = browser_name

app_host, server_host, server_port = case ENV['ENVIRONMENT']
            when 'dev'
             ['https://backoffice-dev.mokapos.com', 'dev.mokapos.com', '80']
            when 'staging'
             ['https://backoffice-staging.mokapos.com', 'staging.mokapos.com', '80']
            when 'pre-prod'
             ['https://backoffice-preprod.mokapos.com', 'preprod.mokapos.com', '80']
            else
             ['https://backoffice.mokapos.com', 'mokapos.com', '80']
            end

Capybara.app_host = app_host
Capybara.server_host = server_host
Capybara.server_port = server_port
Capybara.run_server = false
Capybara.default_max_wait_time = 60

module Capybara
  class << self
    attr_accessor :session_id, :remote_automation_platform
  end
end

# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!

ActionController::Base.allow_rescue = false

Cucumber::Rails::Database.javascript_strategy = :truncation
ShowMeTheCookies.register_adapter(:selenium, ShowMeTheCookies::Selenium)

begin
 DatabaseCleaner.strategy = :transaction
rescue NameError
 raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Before '@javascript' do |scenario|
 @scenario_name = scenario.feature.name
 # page.driver.browser.manage.window.maximize
 page.driver.browser.manage.window.resize_to(resolution1, resolution2)
end

# After '@javascript' do |scenario|
#   Capybara.current_driver = browser_name
#   SauceWhisk::Jobs.change_status(@driver.browser.session_id, scenario.passed?)
#   @driver.quit
# end

# Registered Driver List

require "selenium/webdriver"

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :firefox)
# end


Capybara.register_driver :saucelabs do |app|
  username_saucelabs = ENV['SAUCELABS_USERNAME'] # username saucelabs yang diambil dari .env
  key_saucelabs = ENV['SAUCELABS_ACCESS_KEY'] # access key saucelabs yang diambil dari .env

  caps = {
    :os => platform_version,
    :platform => platform,
    :browserName => browser_saucelabs,
    :browserVersion => browser_version,
    :name => "SEITBSUHA-#{Time.now.to_i}",
    :build => "SEIT_Suha",
  }

  url = "https://#{username_saucelabs}:#{key_saucelabs}@ondemand.saucelabs.com/wd/hub" #url saucelabs yang akan diakses

  #set capailities yang akan digunakan
  @driver = Capybara::Selenium::Driver.new(app, {
    browser: :remote,
    url: url,
    desired_capabilities: caps}
  )
  # SauceWhisk::Jobs.change_status(@driver.browser.session_id, scenario.passed?)
end

Capybara.current_driver = browser_name
