class RemoveShelterIdFromShelter < ActiveRecord::Migration[5.2]
  def change
    remove_column :shelters, :id, :integer
  end
end
