class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|

      t.integer :customer_id
      t.string :name
      t.string :zipcode
      t.string :address

      t.timestamps
    end
  end
end
