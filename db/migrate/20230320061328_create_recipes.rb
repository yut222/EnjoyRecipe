class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.string :title
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
