class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  add_index :users, :uid
  add_index :users, :provider
  add_index :users, [:uid, :provider], unique: true
  end
end
