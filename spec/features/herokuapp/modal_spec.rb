# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../utils/herokuapp/dynamicutils'
require_relative '../../../utils/texts'

RSpec.feature 'Modals', type: :feature do
  scenario 'Check and accept' do
    visit 'https://the-internet.herokuapp.com/entry_ad'

    DynamiCutils.wait_until_visible('#modal', 2, 10)
    expect(find_by_id('modal').text).to eq(Texts::MODAL_TEXT)

    find('p', text: 'Close').click
  end
end
