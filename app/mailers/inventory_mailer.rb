class InventoryMailer < ApplicationMailer

  # ユーザーが登録したメールアドレスにメールを送信できるようにする
  default from: '通知 <notifications@example.com>'

  def expiration_date_stock(user, inventory)
    # @user = User.find_by(email: email)
    @user = user
    mail(to: user.email, subject: '【EnjoyRecipe】 食材の賞味期限について')
  end

end
