class ChangeLngInShelter < ActiveRecord::Migration[5.2]
  def change
    rename_column :shelters, :Lng, :lng
  end
end
