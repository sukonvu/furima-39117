class CreateDeliverycharges < ActiveRecord::Migration[6.0]
  def change
    create_table :deliverycharges do |t|

      t.timestamps
    end
  end
end
