class AddChildPasswordToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :child_password, :string
  end
end
