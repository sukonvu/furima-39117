FactoryBot.define do
  factory :order_address do

    postal_code  {"123-4567"} 
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city {Faker::Address.city}
    address_num {Faker::Address.street_address}
    building_name {Faker::Address.community }
    phone { Faker::Number.number(digits: 11) }
    token { Faker::Internet.password(min_length: 10, max_length: 30) }

  end
end