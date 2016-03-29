class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.references :user, index: true, foreign_key: true
      t.text :timeline
      t.string :url
      t.string :provider

      t.timestamps null: false
    end
  end
end
