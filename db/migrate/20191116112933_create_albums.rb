class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.text :content
      t.integer :child_id
      t.integer :user_id
      t.decimal :longitude, precision: 9, scale: 6
      t.decimal :latitude, precision: 9, scale: 6
      t.string :type

      t.timestamps
    end
    add_index :albums, [:child_id, :user_id, :created_at]
  end
end
