# frozen_string_literal: true

class AddUserIdToGrowths < ActiveRecord::Migration[5.2]
  def change
    add_column :growths, :user_id, :integer
  end
end
