# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../utils/herokuapp/sliderutils'

RSpec.feature 'Alerts tables', type: :feature do
  scenario 'Max' do
    visit 'https://the-internet.herokuapp.com/horizontal_slider'
    SliderUtils.increase(10)
    expect(SliderUtils.slider_values).to eql(5.0)
    SliderUtils.increase(2)
    expect(SliderUtils.slider_values).to eql(5.0)
  end

  scenario 'Min' do
    visit 'https://the-internet.herokuapp.com/horizontal_slider'
    SliderUtils.decrease(10)
    expect(SliderUtils.slider_values).to eql(0.0)
    SliderUtils.decrease(2)
    expect(SliderUtils.slider_values).to eql(0.0)
  end

  scenario 'Min border' do
    visit 'https://the-internet.herokuapp.com/horizontal_slider'
    SliderUtils.decrease(10)
    expect(SliderUtils.slider_values).to eql(0.0)
    SliderUtils.increase(1)
    expect(SliderUtils.slider_values).to eql(0.5)
  end

  scenario 'Max border' do
    visit 'https://the-internet.herokuapp.com/horizontal_slider'
    SliderUtils.increase(10)
    expect(SliderUtils.slider_values).to eql(5.0)
    SliderUtils.decrease(1)
    expect(SliderUtils.slider_values).to eql(4.5)
  end
end
