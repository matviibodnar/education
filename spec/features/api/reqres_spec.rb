# frozen_string_literal: true

require 'spec_helper'
require 'json'

require_relative '../../../utils/reqres'
require_relative '../../../utils/texts'

RSpec.feature 'Basic API interactions', type: :feature do
  it 'Search page 1 users' do
    users = Reqres.get_user
    expect(users.code).to eql(200)
    expect(users.body).to eql(Texts::USERSLIST)
  end

  it 'Search first user' do
    user = Reqres.get_user(1)
    expect(user.code).to eql(200)
    expect(user.body).to eql(Texts::FIRSTUSER)
  end

  it 'DELETE user' do
    user = Reqres.get_user(1)
    expect(user.code).to eql(200)
    expect(user.body).to eql(Texts::FIRSTUSER)

    user = Reqres.del_user(1)
    expect(user.code).to eql(204)
    expect(user.body).to eql(nil)

    user = Reqres.get_user(1)
    expect(user.code).to eql(200)
    expect(user.body).to eql(Texts::FIRSTUSER)
  end

  it 'create user' do
    init_data = Reqres.generate_fake_user
    user = Reqres.create_user(init_data)
    expect(user.code).to eql(201)
    expect(user.body).to have_text(init_data[:name])
    expect(user.body).to have_text(init_data[:job])
  end

  it 'update user' do
    user = Reqres.get_user(1)
    expect(user.code).to eql(200)
    expect(user.body).to eql(Texts::FIRSTUSER)

    init_data = Reqres.generate_fake_user
    user = Reqres.update_user(init_data, 1)
    expect(user.code).to eql(200)
    expect(user.body).to have_text(init_data[:name])
    expect(user.body).to have_text(init_data[:job])
  end
end
