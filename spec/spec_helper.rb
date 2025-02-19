# frozen_string_literal: true

require 'capybara/rspec'
require 'selenium-webdriver'
require 'webdrivers'
require 'allure-rspec'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.run_server = false
end

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

AllureRspec.configure do |config|
  config.results_directory = 'report/allure-results'
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
  config.logger = Logger.new($stdout, Logger::DEBUG)
end
