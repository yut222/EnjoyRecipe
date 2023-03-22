class Tag < ApplicationRecord

  has_many :recipe_tag_relations, dependent: :delete_all
  has_many :recipes, through: :recipe_tag_relations

  validates :name, presence: true, uniqueness: { case_sensitive:  true }

end
