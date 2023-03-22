class Inventory < ApplicationRecord

  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
  validates :quantity, presence: true, length: { maximum: 10 }
  validates :expiration_date, presence: true

  #画像アップロード carrierwave
  mount_uploader :image, InventoryImageUploader

  def days_left
    today = Date.today
    days_left = self.expiration_date - today
    count = days_left.to_i

    if count > 0
      "あと#{count}日"
    else
      "期限切れ"
    end
  end

end
