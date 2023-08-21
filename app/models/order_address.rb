class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_num, :building_name, :phone, :item_id, :token, :user_id
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :address_num
    validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid. Input only number"}
    validates :token
  end
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    
    
    def save(params,user_id)
      order = Order.create(item_id: params[:item_id ], user_id: user_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_num: address_num, building_name: building_name, phone: phone, order_id: order_id)
    end
end

