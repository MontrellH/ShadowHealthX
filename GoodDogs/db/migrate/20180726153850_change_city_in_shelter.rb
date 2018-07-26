class ChangeCityInShelter < ActiveRecord::Migration[5.2]
  def change
    rename_column :shelters, :City, :city
  end
end
