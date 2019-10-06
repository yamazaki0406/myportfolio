# frozen_string_literal: true

class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :name
      t.string :sex
      t.date :birthday

      t.timestamps
    end
  end
end
