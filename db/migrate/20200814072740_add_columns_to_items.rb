class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :name, :string, null: false
    add_column :items, :brand, :string, null: false
    add_column :items, :description, :text, null: false
    add_column :items, :condition, :integer, null: false
    add_column :items, :status, :integer, null: false
    add_column :items, :shipping_costs, :integer, null: false
    add_column :items, :shipping_form, :integer, null: false
    add_column :items, :shipping_date, :integer, null: false
    add_column :items, :price, :integer, null: false
    
  end

end
