class AddAgeToDog < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :age, :integer
  end
end
