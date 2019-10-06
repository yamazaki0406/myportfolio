class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :child, foreign_key: true

      t.timestamps
    end
    add_index :microposts, [:child_id, :created_at]
  end
end
