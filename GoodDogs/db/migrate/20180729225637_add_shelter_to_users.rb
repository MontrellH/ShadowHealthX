class AddShelterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :shelter, foreign_key: true
  end
end
