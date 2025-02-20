# frozen_string_literal: true

# utils/alertutils.rb
module SliderUtils
  def self.increase(number_of_steps = 1)
    number_of_steps.times do
      Capybara.find('input[type="range"]').send_keys(:up)
    end
  end

  def self.decrease(number_of_steps = 1)
    number_of_steps.times do
      Capybara.find('input[type="range"]').send_keys(:down)
    end
  end

  def self.slider_values
    Capybara.find('#range').text.to_f
  end
end
