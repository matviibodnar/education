# frozen_string_literal: true

# utils/ApiUtils.rb
module ApiUtils
  def self.getusers(id = nil)
    response = HTTParty.get('https://fakestoreapi.com/users')

    users = response.parsed_response

    users_by_id = {}

    users.each do |user|
      user_id = user['id']
      full_name = "#{user['name']['firstname'].capitalize} #{user['name']['lastname'].capitalize}"
      address = {
        city: user['address']['city'].capitalize,
        street: user['address']['street'].capitalize,
        number: user['address']['number'],
        zipcode: user['address']['zipcode']
      }

      users_by_id[user_id] = {
        name: full_name,
        email: user['email'],
        phone: user['phone'],
        address: address
      }
    end
    id ? users_by_id[id] : users_by_id
  end

  def self.adduser(data)
    HTTParty.post(
      'https://fakestoreapi.com/users',
      body: generatefakeuser(data).to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def self.generatefakeuser(data = nil)
    {
      username: Faker::Internet.username || data[:username],
      email: Faker::Internet.email || data[:email],
      password: Faker::Internet.password(min_length: 8) || data[:password]
    }
  end

  def self.fact(max_length = nil)
    url = 'https://catfact.ninja/fact'
    url += "?max_length=#{max_length}" if max_length

    HTTParty.get(url)
  end
end
