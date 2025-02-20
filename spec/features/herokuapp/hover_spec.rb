# frozen_string_literal: true

require 'spec_helper'

RSpec.feature 'Hover', type: :feature do
  scenario 'Hover over user #1' do
    visit 'https://the-internet.herokuapp.com/hovers'

    all('.figure')[0].hover

    find('a', text: 'View profile').click

    expect(page.current_url).to eq('https://the-internet.herokuapp.com/users/1')
  end
  scenario 'Hover over user #2' do
    visit 'https://the-internet.herokuapp.com/hovers'

    all('.figure')[1].hover

    find('a', text: 'View profile').click

    expect(page.current_url).to eq('https://the-internet.herokuapp.com/users/2')
  end
  scenario 'Hover over user #3' do
    visit 'https://the-internet.herokuapp.com/hovers'

    all('.figure')[2].hover

    find('a', text: 'View profile').click

    expect(page.current_url).to eq('https://the-internet.herokuapp.com/users/3')
  end
end
