class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true, foreign_key: true
      t.string :provider
      t.string :avatar_url
      t.string :profile_url
      t.string :refreshtoken
      t.string :uid
      t.string :accesstoken 
      t.string :secret
      t.references :user_id
      t.timestamps null: false
    end
   # add_index :identities, [:uid, :provider], unique: true
    #add_index :identities, :user_id
  end
end
