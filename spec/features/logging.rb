# frozen_string_literal: true

require 'spec_helper'
require_relative '../../utils/logutils'
require_relative '../../utils/texts'

RSpec.feature 'Home Page', type: :feature do
  scenario 'Happy logging' do
    visit 'https://www.saucedemo.com/'

    expect(page).to have_content('Swag Labs')

    LogUtils.login

    expect(page).to have_text(Texts::MAIN_PAGE)
  end

  scenario 'Unhappy logging(wrong username)' do
    visit 'https://www.saucedemo.com/'

    expect(page).to have_content('Swag Labs')

    LogUtils.login('wrong-username')

    expect(page).to have_text(Texts::LOGIN_ERROR_MESSAGE)
  end

  scenario 'Unhappy logging(wrong password)' do
    visit 'https://www.saucedemo.com/'

    expect(page).to have_content('Swag Labs')

    LogUtils.login('user-name', 'wrong-password')

    expect(page).to have_text(Texts::LOGIN_ERROR_MESSAGE)
  end
end
