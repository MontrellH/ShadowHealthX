class ChangeLatInShelter < ActiveRecord::Migration[5.2]
  def change
    rename_column :shelters, :Lat, :lat
  end
end
