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
end
