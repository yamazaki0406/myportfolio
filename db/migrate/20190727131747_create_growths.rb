# frozen_string_literal: true

class CreateGrowths < ActiveRecord::Migration[5.2]
  def change
    create_table :growths do |t|
      t.date :date
      t.float :height
      t.float :weight
      t.references :child, foreign_key: true

      t.timestamps
    end
  end
end
