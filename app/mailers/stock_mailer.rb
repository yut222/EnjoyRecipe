class StockMailer < ApplicationMailer

  def send_when_stock(user, stock) #メソッドに対して引数を設定
    @user = User.find_by(email: email) #ユーザー情報
    mail to: user.email, subject: '【EnjoyRecipe】 食材の賞味期限について'
  end

end