class AddAvatarsToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :avatars, :string
  end
end
