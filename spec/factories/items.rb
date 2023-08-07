FactoryBot.define do
  factory :item do
    item_name { "MyString" }
    description { "MyText" }
    condition_id { 1 }
    category_id { 1 }
    delivery_charge_id { 1 }
    prefecture_id { 1 }
    shipping_date_id { 1 }
    price { 1 }
    user { nil }
  end
end
