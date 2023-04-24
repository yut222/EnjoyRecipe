class CreateRecipeTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_tag_relations do |t|
      t.bigint :recipe, null: false, foreign_key: true
      t.bigint :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
