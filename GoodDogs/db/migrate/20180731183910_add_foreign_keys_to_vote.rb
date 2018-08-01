class AddForeignKeysToVote < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :dog_id, :dogs
    add_foreign_key :user_id, :users
  end
end
