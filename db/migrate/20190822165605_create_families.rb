# frozen_string_literal: true

class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.references :child, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
