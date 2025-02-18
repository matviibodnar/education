# frozen_string_literal: true

require 'capybara/rspec'
require 'selenium-webdriver'
require 'webdrivers'
require 'allure-rspec'
require 'tmpdir'

RSpec.configure do |config|
  config.before(:each) do
    user_data_dir = Dir.mktmpdir
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument("--user-data-dir=#{user_data_dir}")
    options.add_argument('--headless')

    Capybara.register_driver :selenium_chrome do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
    end

    Capybara.current_driver = :selenium_chrome
  end

  config.after(:each) do
  end
end

AllureRspec.configure do |config|
  config.results_directory = 'report/allure-results'
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
  config.logger = Logger.new($stdout, Logger::DEBUG)
end
