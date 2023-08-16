FactoryBot.define do
  factory :item do
    association :user
    item_name { 'テスト商品' }
    description { 'これはテスト商品です。' }
    condition_id { 2 }
    category_id { 2 }
    delivery_charge_id { 2 }
    prefecture_id { 2 }
    shipping_date_id { 2 }
    price { 1000 }
  after(:build) do |item|
      item.item_image.attach(io: File.open(Rails.root.join('test', 'fixtures', 'images', 'sample.jpg')), filename: 'sample.jpg', content_type: 'image/jpeg')
    end
  end
end
