class Comment < ApplicationRecord

  belongs_to :recipe
  belongs_to :user

  has_many :replies, class_name: :Comment, foreign_key: :reply_comment, dependent: :destroy

  validates :content, presence: true, length: { maximum: 100 }

end
