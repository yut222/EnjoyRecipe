class CreateRecipeTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_tag_relations do |t|
      t.bigint :recipe_id, null: false, foreign_key: true
      t.bigint :tag_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
