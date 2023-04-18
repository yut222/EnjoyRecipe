class StockMailer < ApplicationMailer

  def expiration_date_stock(user, stock) #メソッドに対して引数を設定
    
    @user = User.find_by(email: email) #ユーザー情報
    mail to: user.email, subject: '【EnjoyRecipe】 食材の賞味期限について'
  end
  
  scope :published_yesterday, -> { where('published_at: 1.day.ago.all_day') }

end