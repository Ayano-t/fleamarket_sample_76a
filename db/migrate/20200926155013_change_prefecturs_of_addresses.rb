class ChangePrefectursOfAddresses < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :prefecturs, :string, default: 0
  end

  def down
    change_column :addresses, :prefecturs, :string
  end
end
