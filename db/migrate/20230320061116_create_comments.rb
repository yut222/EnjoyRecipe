class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :recipe_id, null: false, foreign_key: true
      t.text :content, null: false
      t.integer :comments, :reply_comment

      t.timestamps
    end
  end
end
