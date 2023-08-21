class AddUserAddressToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :postal_code, :string, null: false
    add_column :addresses, :prefecture_id, :integer, null: false
    add_column :addresses, :city, :string, null: false
    add_column :addresses, :building_name, :string
    add_column :addresses, :phone, :string, null: false
    add_reference :addresses, :order, null: false
  end
end
