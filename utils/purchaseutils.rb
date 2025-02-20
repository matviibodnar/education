# frozen_string_literal: true

require 'rspec/expectations'

# utils/purchaseutils.rb
module PurchaseUtils
  def self.add_to_cart(index)
    Capybara.all('button', text: 'Add to cart')[index].click
  end

  def self.cart_value
    Capybara.find('span.shopping_cart_badge[data-test="shopping-cart-badge"]').text.to_i
  end

  def self.click_shopping_cart
    Capybara.find('#shopping_cart_container a').click
  end

  def self.checkout
    Capybara.click_button 'Checkout'
  end

  def self.checkout_information(firstname = 'Jhon', lastname = 'Doe', zipcode = '12345')
    Capybara.fill_in 'first-name', with: firstname
    Capybara.fill_in 'last-name', with: lastname
    Capybara.fill_in 'postal-code', with: zipcode
  end

  def self.continue
    Capybara.click_button 'Continue'
  end

  def self.extract_number(string)
    string.scan(/\d+\.\d+/).first.to_f
  end

  def self.find_values
    {
      item_total: find_price('.summary_subtotal_label'),
      tax_total: find_price('.summary_tax_label'),
      total: find_price('.summary_total_label')
    }
  end

  def self.find_price(selector)
    element_text = Capybara.find(selector).text.strip
    extract_number(element_text) unless element_text.empty?
  end

  def self.finish
    Capybara.click_button 'Finish'
  end

  def self.find_all_selector(selector, type)
    elements = []

    if type == 'number'
      Capybara.all(selector).each do |element|
        new_element = PurchaseUtils.extract_number(element.text.strip)
        elements << new_element
      end
    elsif type == 'string'
      Capybara.all(selector).each do |element|
        new_element = element.text.strip
        elements << new_element
      end
    end

    elements
  end

  def self.sortinglist(selector)
    select = Capybara.find('select.product_sort_container')
    select.select(selector)
  end

  def self.random_products(number)
    numbers = []

    numbers = Array.new(number) { rand(0..5) } while numbers.uniq.length < number
    numbers.sort!.reverse!

    expected_values = { item_total: 0, tax_total: 0, total: 0 }

    numbers.each do |num|
      product_data = price_data(num)

      expected_values[:item_total] += product_data[:item_total]
      expected_values[:tax_total] += product_data[:tax_total]
      expected_values[:total] += product_data[:total]
    end

    expected_values.each do |key, value|
      expected_values[key] = value.round(2)
    end

    { numbers: numbers, expected_values: expected_values }
  end

  def self.price_data(number)
    totals_lookup = [
      { item_total: 29.99, tax_total: 2.4, total: 32.39 },
      { item_total: 9.99, tax_total: 0.8, total: 10.79 },
      { item_total: 15.99, tax_total: 1.28, total: 17.27 },
      { item_total: 49.99, tax_total: 4.0, total: 53.99 },
      { item_total: 7.99, tax_total: 0.64, total: 8.63 },
      { item_total: 15.99, tax_total: 1.28, total: 17.27 }
    ]
    totals_lookup[number]
  end
end
