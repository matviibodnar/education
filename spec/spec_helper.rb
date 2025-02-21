# frozen_string_literal: true

require 'capybara/rspec'
require 'selenium-webdriver'
require 'webdrivers'
require 'allure-rspec'
require 'tmpdir'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome_headless
  config.run_server = false
end

Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')

  user_data_dir = Dir.mktmpdir("chrome-test-profile-#{SecureRandom.hex(8)}")
  options.add_argument("--user-data-dir=#{user_data_dir}")

  at_exit do
    FileUtils.remove_entry_secure(user_data_dir) if Dir.exist?(user_data_dir)
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

AllureRspec.configure do |config|
  config.results_directory = 'report/allure-results'
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
  config.logger = Logger.new($stdout, Logger::DEBUG)
end
