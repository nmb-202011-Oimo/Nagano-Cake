class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.integer :shipping_fee
      t.integer :payment, default: 0
      t.integer :total_price
      t.string :zipcode
      t.string :address
      t.string :name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
