class RemoveConfirmPasswordFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :confirm_password, :digest
  end
end
