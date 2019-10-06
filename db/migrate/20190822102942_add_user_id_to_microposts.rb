# frozen_string_literal: true

class AddUserIdToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :user_id, :integer
  end
end
