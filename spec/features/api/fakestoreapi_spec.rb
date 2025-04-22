# frozen_string_literal: true

require 'spec_helper'

require_relative '../../../utils/apiutils'

RSpec.feature 'Basic API interactions', type: :feature do
  it 'Basic API interactions' do
    ApiUtils.getusers

    data = ApiUtils.generatefakeuser

    user = ApiUtils.adduser(data)
    expect(user.code).to eql(200)
  end
  it 'Cat fact API' do
    random_length = rand(30..100)

    fact = ApiUtils.fact(random_length)

    parsed_response = JSON.parse(fact.body)
    length = parsed_response['length'].to_i

    expect(fact.code).to eql(200)
    expect(length).to be <= random_length
  end
end
