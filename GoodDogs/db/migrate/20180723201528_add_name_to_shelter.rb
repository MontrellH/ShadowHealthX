class AddNameToShelter < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :Name, :string
  end
end