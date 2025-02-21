# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../utils/herokuapp/dynamicutils'

RSpec.feature 'Element on page that is hidden', type: :feature do
  scenario 'Element on page that is hidden' do
    visit 'https://the-internet.herokuapp.com/dynamic_loading/1'

    click_button 'Start'

    DynamiCutils.wait_until_visible('#finish', 2, 10)

    expect(find('#finish').text).to eq('Hello World!')
  end
  scenario 'Element rendered after the fact' do
    visit 'https://the-internet.herokuapp.com/dynamic_loading/2'

    click_button 'Start'

    DynamiCutils.wait_until_visible('#finish', 2, 10)

    expect(find('#finish').text).to eq('Hello World!')
  end
end
