class RemovePostalCodeFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :postal_code, :string
  end
end
