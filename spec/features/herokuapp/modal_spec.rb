# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../utils/herokuapp/dynamicutils'
require_relative '../../../utils/texts'

RSpec.feature 'Modals', type: :feature do
  scenario 'Check and accept' do
    visit 'https://the-internet.herokuapp.com/entry_ad'

    expect(find_by_id('modal').text).to eq(Texts::MODAL_TEXT)

    click_button 'Close'
  end
end
