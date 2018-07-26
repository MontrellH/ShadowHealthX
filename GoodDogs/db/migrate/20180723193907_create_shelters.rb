class CreateShelters < ActiveRecord::Migration[5.2]
  def change
    create_table :shelters do |t|
      t.integer :id
      t.string :name
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
