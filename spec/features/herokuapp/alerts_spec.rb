# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../utils/herokuapp/dynamicutils'

RSpec.feature 'Alerts tables', type: :feature do
  scenario 'Information alert' do
    visit 'https://the-internet.herokuapp.com/javascript_alerts'

    click_button 'Click for JS Alert'

    alert_text = DynamiCutils.alert_text
    expect(alert_text).to eq('I am a JS Alert')

    DynamiCutils.accept_alert
  end

  scenario 'Accept alert' do
    visit 'https://the-internet.herokuapp.com/javascript_alerts'

    click_button 'Click for JS Confirm'

    alert_text = DynamiCutils.alert_text
    expect(alert_text).to eq('I am a JS Confirm')

    DynamiCutils.accept_alert

    expect(DynamiCutils.result_text).to eq('You clicked: Ok')
  end

  scenario 'Decline alert' do
    visit 'https://the-internet.herokuapp.com/javascript_alerts'

    click_button 'Click for JS Confirm'

    alert_text = DynamiCutils.alert_text
    expect(alert_text).to eq('I am a JS Confirm')

    DynamiCutils.dismis_alert

    expect(DynamiCutils.result_text).to eq('You clicked: Cancel')
  end

  scenario 'Input alert' do
    visit 'https://the-internet.herokuapp.com/javascript_alerts'

    click_button 'Click for JS Prompt'

    DynamiCutils.input_alert_accept('test')

    expect(DynamiCutils.result_text).to eq('test')
  end

  scenario 'Input alert decline' do
    visit 'https://the-internet.herokuapp.com/javascript_alerts'

    click_button 'Click for JS Prompt'

    DynamiCutils.input_alert_dismiss('test')

    expect(DynamiCutils.result_text).to eq('null')
  end
end
