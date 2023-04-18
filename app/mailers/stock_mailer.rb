class StockMailer < ApplicationMailer

  def expiration_date_stock(user, stock) #メソッドに対して引数を設定
    # @stock_expiration_all = Stock.expiration_at_all
    @user = user
    mail to: user.email, subject: '【EnjoyRecipe】 食材の賞味期限について'
  end

  # scope :expiration_all, -> { where('expiration_at: all_day') }

end