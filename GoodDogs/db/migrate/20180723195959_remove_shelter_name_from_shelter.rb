class RemoveShelterNameFromShelter < ActiveRecord::Migration[5.2]
  def change
    remove_column :shelters, :name, :string
  end
end
