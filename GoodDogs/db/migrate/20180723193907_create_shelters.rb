class CreateShelters < ActiveRecord::Migration[5.2]
  def change
    create_table :shelters do |t|
      t.integer :ShelterID
      t.string :ShelterName
      t.string :Address
      t.string :City

      t.timestamps
    end
  end
end
