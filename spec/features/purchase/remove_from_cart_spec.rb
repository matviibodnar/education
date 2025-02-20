# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../utils/logutils'
require_relative '../../../utils/purchaseutils'
require_relative '../../../utils/texts'

RSpec.feature 'Remove from cart test', type: :feature do
  scenario 'Remove from main page' do
    amount_of_products = 3
    data = PurchaseUtils.random_products(amount_of_products)

    product_id = data[:numbers]

    # Step 1: Visit homepage and login
    LogUtils.login
    expect(page).to have_text(Texts::MAIN_PAGE)

    # Step 2: Add items to cart and verify cart
    amount_of_products.times do |count|
      PurchaseUtils.add_to_cart(product_id[count])
      expect(PurchaseUtils.cart_value).to be(count + 1)
    end

    # Step 3: Remove items in cart and verify cart
    amount_of_products.downto(2).each do |count|
      PurchaseUtils.remove(0)
      expect(PurchaseUtils.cart_value).to be(count - 1)
    end
  end

  scenario 'Remove from cart' do
    amount_of_products = 3
    data = PurchaseUtils.random_products(amount_of_products)

    product_id = data[:numbers]

    # Step 1: Visit homepage and login
    LogUtils.login
    expect(page).to have_text(Texts::MAIN_PAGE)

    # Step 2: Add items to cart and verify cart
    amount_of_products.times do |count|
      PurchaseUtils.add_to_cart(product_id[count])
      expect(PurchaseUtils.cart_value).to be(count + 1)
    end

    PurchaseUtils.click_shopping_cart

    # Step 3: Remove items in cart and verify cart
    amount_of_products.downto(2).each do |count|
      PurchaseUtils.remove(0)
      expect(PurchaseUtils.cart_value).to be(count - 1)
    end
  end
end
