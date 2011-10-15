class RemovePasswordHashFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :password_hash
    remove_column :users, :password_salt
  end

  def down
  end
end
