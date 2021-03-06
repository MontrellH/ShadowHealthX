class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.text :description
      t.integer :points
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
