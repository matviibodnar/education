# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../utils/herokuapp/dynamicutils'

RSpec.feature 'Dynamic controls', type: :feature do
  scenario 'Dynamic controls' do
    visit 'https://the-internet.herokuapp.com/dynamic_controls'

    DynamiCutils.click_checkbox

    click_button 'Enable'

    DynamiCutils.wait_until_visible('input[type="text"]', 1, 15)

    expect(find('input[type="text"]').text).to eq('')

    DynamiCutils.click_checkbox

    find('input[type="text"]').send_keys('i like cats')

    click_button 'Remove'

    DynamiCutils.wait_until_visible('#message', 1, 15)

    click_button 'Add'

    DynamiCutils.wait_until_visible('input[type="checkbox"]', 1, 15)

    DynamiCutils.click_checkbox

    DynamiCutils.click_checkbox
  end
end
