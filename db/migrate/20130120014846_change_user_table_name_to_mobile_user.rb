class ChangeUserTableNameToMobileUser < ActiveRecord::Migration
  def up
    rename_table :users, :mobile_users
    rename_column :incidents, :user_id, :mobile_user_id
  end

  def down
    rename_table :mobile_users, :users
    rename_column :incidents, :mobile_user_id, :user_id
  end
end
