class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :mobile_contact
      t.string :alternative_contact
      t.string :next_of_kin
      t.string :mobile_of_kin
      t.string :physical_address
      t.string :occupants_in_house_hold

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
