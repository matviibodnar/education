# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../utils/herokuapp/dynamicutils'
require_relative '../../../utils/texts'

RSpec.feature 'Iframe', type: :feature do
  scenario 'Check iframe' do
    visit 'https://the-internet.herokuapp.com/tinymce'

    find(".tox-notification__dismiss").click

    expect(page.text).to have_text(Texts::IFRAME)

    expect((all(".tox")[0].text)). to have_text(Texts::IFRAME_TABS)
  end
  scenario 'Check URL on the last tab' do
    visit 'https://the-internet.herokuapp.com/tinymce'

    find('span', class: 'tox-statusbar__branding').click

    window = windows.last
    switch_to_window(window)

    expect(page).to have_current_path('https://www.tiny.cloud/?utm_campaign=editor_referral&utm_medium=poweredby&utm_source=tinymce&utm_content=v5')
  end
end
