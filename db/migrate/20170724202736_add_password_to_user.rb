class AddPasswordToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password, :string, null: false, default: ""
  end
end
