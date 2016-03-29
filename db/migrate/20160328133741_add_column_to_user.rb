class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :uid, :string
    add_column :users, :provider, :string 
    add_index :users, :uid
  add_index :users, :provider
  add_index :users, [:uid, :provider], unique: true
  end
end
