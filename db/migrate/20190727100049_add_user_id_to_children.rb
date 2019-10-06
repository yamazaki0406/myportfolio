# frozen_string_literal: true

class AddUserIdToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :user_id, :integer
  end
end
