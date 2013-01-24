class AddUserToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :user_id, :integer
  end
end
