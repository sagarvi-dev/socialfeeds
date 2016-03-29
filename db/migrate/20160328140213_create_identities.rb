class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true, foreign_key: true
      t.string :provider
      t.string :avatar_url
      t.string :profile_url
      t.string :refreshtoken

      t.timestamps null: false
    end
  end
end
