# frozen_string_literal: true

# utils/reqres.rb
module Reqres
  def self.get_user(id = nil)
    HTTParty.get("https://reqres.in/api/users/#{id}")
  end

  def self.del_user(id = nil)
    HTTParty.delete("https://reqres.in/api/users/#{id}")
  end

  def self.generate_fake_user(data = {})
    data ||= {}
    data.merge(
      name: Faker::Name.name,
      job: Faker::Job.title
    )
  end

  def self.create_user(data = nil)
    HTTParty.post(
      'https://reqres.in/api/users',
      body: data.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def self.update_user(data = nil, id)
    HTTParty.put(
      "https://reqres.in/api/users/#{id}",
      body: data.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def self.register(data = nil)
    HTTParty.put(
      'https://reqres.in/api/register',
      body: data.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end
end
