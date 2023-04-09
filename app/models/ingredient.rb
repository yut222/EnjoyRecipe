class Ingredient < ApplicationRecord

  belongs_to :recipe

    # 材料・分量指定のバリデーション
  validates :content, presence: true
  validates :quantity, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "quantity", "recipe_id", "updated_at"]
  end

end