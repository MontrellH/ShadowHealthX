class AddLngToShelter < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :Lng, :decimal
  end
end
