class CreateIncidents < ActiveRecord::Migration
  def up
    create_table :incidents do |t|
      t.string :category
      t.references :user
      t.string :status
      t.string :reference

      t.timestamps
    end

    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.string :street
      t.references :incident

      t.timestamps
    end
  end

  def down
    drop_table :locations
    drop_table :incidents
  end
end
