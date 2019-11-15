class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.text :content
      t.integer :child_id
      t.integer :user_id
      t.decimal :longitude, precision: 9, scale: 6
      t.decimal :latitude, precision: 9, scale: 6
      t.timestamps
    end
  end
end
