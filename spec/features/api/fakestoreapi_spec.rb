# frozen_string_literal: true

require 'spec_helper'

require_relative '../../../utils/ApiUtils'

RSpec.feature 'Basic API interactions', type: :feature do
  it 'Basic API interactions' do
    puts ApiUtils.getusers

    data = ApiUtils.generatefakeuser
    puts data

    user = ApiUtils.adduser(data)
    expect(user.code).to eql(200)
  end
  it 'Cat fact API' do
    random_length = rand(30..100)

    fact = ApiUtils.fact(random_length)

    parsed_response = JSON.parse(fact.body)
    p parsed_response
    length = parsed_response['length'].to_i

    expect(fact.code).to eql(200)
    p "Initial lenght#{random_length}"
    p "Response lenght#{length}"
    p "length < random_length#{length < random_length}"
    expect(length).to be < random_length
  end
end
