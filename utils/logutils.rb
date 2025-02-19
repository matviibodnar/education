# frozen_string_literal: true

# utils/logutils.rb
module LogUtils
  def self.login(username = 'standard_user', password = 'secret_sauce')
    Capybara.visit 'https://www.saucedemo.com/'

    Capybara.fill_in 'user-name', with: username
    Capybara.fill_in 'password', with: password

    Capybara.click_button 'Login'
  end
end
