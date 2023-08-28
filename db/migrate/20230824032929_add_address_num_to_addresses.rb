class AddAddressNumToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :address_num, :string, null: false
  end
end
