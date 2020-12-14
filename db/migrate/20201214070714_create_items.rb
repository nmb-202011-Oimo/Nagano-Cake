class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :category_id
      t.string :name
      t.integer :price
      t.text :introduction
      t.string :image_id
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
