class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :friend, index: true, foreign_key: true
      t.text :body
      t.boolean :is_read
      t.timestamps null: false
    end
  end
end
