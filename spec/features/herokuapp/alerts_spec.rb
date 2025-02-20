# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../utils/herokuapp/alertutils'

RSpec.feature 'Alerts tables', type: :feature do
  scenario 'Information alert' do
    visit 'https://the-internet.herokuapp.com/javascript_alerts'

    click_button 'Click for JS Alert'

    alert_text = AlertUtils.alert_text
    expect(alert_text).to eq('I am a JS Alert')

    AlertUtils.accept_alert
  end

  scenario 'Accept alert' do
    visit 'https://the-internet.herokuapp.com/javascript_alerts'

    click_button 'Click for JS Confirm'

    alert_text = AlertUtils.alert_text
    expect(alert_text).to eq('I am a JS Confirm')

    AlertUtils.accept_alert

    expect(AlertUtils.result_text).to eq('You clicked: Ok')
  end

  scenario 'Decline alert' do
    visit 'https://the-internet.herokuapp.com/javascript_alerts'

    click_button 'Click for JS Confirm'

    alert_text = AlertUtils.alert_text
    expect(alert_text).to eq('I am a JS Confirm')

    AlertUtils.dismis_alert

    expect(AlertUtils.result_text).to eq('You clicked: Cancel')
  end

  scenario 'Input alert' do
    visit 'https://the-internet.herokuapp.com/javascript_alerts'

    click_button 'Click for JS Prompt'

    AlertUtils.input_alert_accept('test')

    expect(AlertUtils.result_text).to eq('test')
  end

  scenario 'Input alert decline' do
    visit 'https://the-internet.herokuapp.com/javascript_alerts'

    click_button 'Click for JS Prompt'

    AlertUtils.input_alert_dismiss('test')

    expect(AlertUtils.result_text).to eq('null')
  end
end
