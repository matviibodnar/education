# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../utils/logutils'
require_relative '../../../utils/purchaseutils'
require_relative '../../../utils/texts'

RSpec.feature 'Happy purchase of onesie', type: :feature do
  scenario 'Happy purchase of onesie' do
    expected_values = {
      item_total: 7.99,
      tax_total: 0.64,
      total: 8.63
    }

    # Step 1: Visit homepage and login
    LogUtils.login
    expect(page).to have_text(Texts::MAIN_PAGE)

    # Step 2: Add item to cart and verify cart
    PurchaseUtils.add_to_cart(4)
    expect(PurchaseUtils.cart_value).to be 1

    PurchaseUtils.click_shopping_cart

    # Step 3: Perform checkout
    PurchaseUtils.checkout
    PurchaseUtils.checkout_information
    PurchaseUtils.continue

    # Step 4: Verify prices and totals
    values = PurchaseUtils.find_values
    expect(values).to eq(expected_values)
    expect(page).to have_content(Texts::OBESIE)

    # Step 5: Finalize purchase and verify checkout page
    PurchaseUtils.finish
    expect(page).to have_text(Texts::CHECKOUT)
  end
end
