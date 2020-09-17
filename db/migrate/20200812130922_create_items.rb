class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.text :description, null: false

      t.integer :condition, null: false 
      t.integer :status, null: false
      t.integer :shipping_costs, null: false
      t.integer :shipping_from, null: false
      t.integer :shipping_date, null: false
      
      t.integer :price, null: false

      t.references :seller, null: false, foreign_key: {to_table: :items}
      t.references :buyer, null: false, foreign_key: {to_table: :items}
      t.references :category, null: false, foreign_key: {to_table: :items}

      t.timestamps
    end
  end
end