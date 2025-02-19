# frozen_string_literal: true

require 'spec_helper'
require_relative '../../utils/logutils'
require_relative '../../utils/purchaseutils'
require_relative '../../utils/texts'

RSpec.feature 'Check sorting', type: :feature do
  scenario 'Price (low to high)' do
    LogUtils.login
    expect(page).to have_text(Texts::MAIN_PAGE)

    initial_prices = PurchaseUtils.find_all_selector('.inventory_item_price', 'number')

    PurchaseUtils.sortinglist('Price (low to high)')

    sorted_prices = PurchaseUtils.find_all_selector('.inventory_item_price', 'number')
    expect(sorted_prices).to eq(initial_prices.sort)
  end

  scenario 'Price (high to low)' do
    LogUtils.login
    expect(page).to have_text(Texts::MAIN_PAGE)

    initial_prices = PurchaseUtils.find_all_selector('.inventory_item_price', 'number')

    PurchaseUtils.sortinglist('Price (high to low)')

    sorted_prices = PurchaseUtils.find_all_selector('.inventory_item_price', 'number')
    expect(sorted_prices).to eq(initial_prices.sort.reverse)
  end

  scenario 'Name (A to Z)' do
    LogUtils.login
    expect(page).to have_text(Texts::MAIN_PAGE)

    initial_prices = PurchaseUtils.find_all_selector('.inventory_item_name', 'string')

    PurchaseUtils.sortinglist('Name (A to Z)')

    sorted_prices = PurchaseUtils.find_all_selector('.inventory_item_name', 'string')
    expect(sorted_prices).to eq(initial_prices.sort)
  end

  scenario 'Name (Z to A)' do
    LogUtils.login
    expect(page).to have_text(Texts::MAIN_PAGE)

    initial_prices = PurchaseUtils.find_all_selector('.inventory_item_name', 'string')

    PurchaseUtils.sortinglist('Name (Z to A)')

    sorted_prices = PurchaseUtils.find_all_selector('.inventory_item_name', 'string')
    expect(sorted_prices).to eq(initial_prices.sort.reverse)
  end
end
