class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.text :content
      t.integer :child_id
      t.integer :user_id

      t.timestamps
    end
  end
end
