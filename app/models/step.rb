class Step < ApplicationRecord

  belongs_to :recipe

  validates :direction, presence: true

  #画像アップロード carrierwave
  mount_uploader :image, StepImageUploader
end
