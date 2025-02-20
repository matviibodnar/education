# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../utils/logutils'
require_relative '../../../utils/purchaseutils'
require_relative '../../../utils/texts'

RSpec.feature 'Happy purchase of backpack', type: :feature do
  scenario 'Happy purchase of backpack' do
    amount_of_products = 3
    data = PurchaseUtils.random_products(amount_of_products)

    product_id = data[:numbers]
    expected_values = data[:expected_values]

    # Step 1: Visit homepage and login
    LogUtils.login
    expect(page).to have_text(Texts::MAIN_PAGE)

    # Step 2: Add items to cart and verify cart
    amount_of_products.times do |count|
      PurchaseUtils.add_to_cart(product_id[count])
      expect(PurchaseUtils.cart_value).to be(count + 1)
    end

    PurchaseUtils.click_shopping_cart

    # Step 3: Perform checkout
    PurchaseUtils.checkout
    PurchaseUtils.checkout_information
    PurchaseUtils.continue

    # Step 4: Verify prices and totals
    values = PurchaseUtils.find_values
    expect(values).to eq(expected_values)

    # Step 5: Finalize purchase and verify checkout page
    PurchaseUtils.finish
    expect(page).to have_text(Texts::CHECKOUT)
  end
end
