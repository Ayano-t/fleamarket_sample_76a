class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name,             null: false
      t.text :description,        null: false
      t.string :brand,            null: false
      t.integer :condition,       null: false, default: 1
      t.integer :status,          null: false, default: 1
      t.integer :shipping_costs,  null: false, default: 1
      t.integer :shipping_from,   null: false, default: 1
      t.integer :shipping_date,   null: false, default: 1
      t.integer :price,           null: false, default: 0
    end
  end
end
