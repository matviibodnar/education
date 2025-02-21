# frozen_string_literal: true

# utils/dynamicutils.rb
module DynamiCutils
  def self.accept_alert
    alert = Capybara.page.driver.browser.switch_to.alert
    alert.accept
  end

  def self.dismis_alert
    alert = Capybara.page.driver.browser.switch_to.alert
    alert.dismiss
  end

  def self.input_alert_accept(text)
    alert = Capybara.page.driver.browser.switch_to.alert
    alert.send_keys(text)
    alert.accept
  end

  def self.input_alert_dismiss(text)
    alert = Capybara.page.driver.browser.switch_to.alert
    alert.send_keys(text)
    alert.dismiss
  end

  def self.alert_text
    alert = Capybara.page.driver.browser.switch_to.alert
    alert.text
  end

  def self.result_text
    Capybara.find('#result').text.gsub('You entered:', '').strip
  end

  def self.wait_until_visible(locator, timeout = 10, retries = 5)
    retries.times do |_attempt|
      begin
        element = Capybara.find(locator, wait: timeout)
        return element if element.visible? && !element.disabled?
      rescue Capybara::ElementNotFound
      end
      sleep(2)
    end
    raise Capybara::ElementNotFound,
          "Element '#{locator}' not visible or interactable"
  end

  def self.click_checkbox
    Capybara.find('input[type="checkbox"]').click
  end
end
