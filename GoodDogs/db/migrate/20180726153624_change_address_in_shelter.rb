class ChangeAddressInShelter < ActiveRecord::Migration[5.2]
  def change
    rename_column :shelters, :Address, :address
  end
end
