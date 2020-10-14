class RemovePsswordConformFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password_conform, :string 
  end
end
