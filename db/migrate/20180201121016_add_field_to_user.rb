class AddFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :auth_token, :string
    add_column :users, :role, :string
    
    add_index :users, :auth_token
  end
end
