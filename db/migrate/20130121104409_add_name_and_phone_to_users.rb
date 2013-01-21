class AddNameAndPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :null => false, :default => ""
    add_column :users, :phone, :string, :null => false, :default => ""
  end
end
