class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code,        null: false
      t.string :prefecturs,         null: false
      t.string :municipalities,     null: false
      t.string :block_number,       null: false
      t.string :building_name,      null: false
      t.string :phone_number,       null: false
      t.string :postal_code,        null: false
      t.references :user,           foreign_key: true
      
      t.timestamps
    end
  end
end
