class AddLatToShelter < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :Lat, :decimal
  end
end
