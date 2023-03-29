class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # アソシエーション
  has_many :recipes, dependent: :destroy
  has_many :comments

  has_many :active_relationships,
              class_name:  "Relationship",
              foreign_key: "follower_id",
              dependent:   :destroy

  has_many :passive_relationships,
              class_name:  "Relationship",
              foreign_key: "followed_id",
              dependent:   :destroy

  # フォロー機能について
  has_many :following,
              through: :active_relationships,
              source: :followed

  has_many :followers,
              through: :passive_relationships,
              source: :follower

  # 食材管理について
  has_many :inventories, dependent: :destroy

  # いいね機能関連
  has_many :favorites, dependent: :destroy

  has_many :favorite_recipes, through: :favorites, source: :recipe

  # mount_uploader :avatar, AvatarUploader

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,20}\z/
  validates :password,
            presence: true, on: :create,
            format: { with: VALID_PASSWORD_REGEX,
                      message: "は半角6~20文字英大文字・小文字・数字それぞれ1文字以上含む必要があります"}
  validates :password_confirmation,
            presence: true, on: :create,
            format: { with: VALID_PASSWORD_REGEX,
                      message: "は半角6~20文字英大文字・小文字・数字それぞれ1文字以上含む必要があります"}


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#,
        # :confirmable, :lockable, :timeoutable, :trackable  # 追記

  # バリデーション
  def validate_name
    errors.add(:name, :invalid) if User.where(email: name).exists?
  end

  def follow(other_user)
    self.following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    self.active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    self.following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Recipe.where("user_id IN (#{following_ids}) OR user_id = :user_id",
                                   user_id: self.id)
  end

  def already_favorited?(recipe)
    self.favorites.exists?(recipe_id: recipe.id)
  end

  def already_interested?(consultation)
    self.interests.exists?(consultation_id: consultation.id)
  end

  # ゲストログイン
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
      user.password = (0..19).map { o[rand(o.length)] }.join
      user.password_confirmation = user.password
    end
  end

  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  # 退会済みの時のエラーメッセージ
  def inactive_message
    if is_deleted?
      :withdrawal
    else
      super
    end
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
end
