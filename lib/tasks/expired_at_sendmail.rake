namespace :expired_at_sendmail do
  desc '管理者に対して総記事数、昨日公開された記事があれば記事数とタイトルをメールで送信'
  task mail_expiration_stock: :environment do
    user = User.find(13) #TODO 修正
    stock = nil #TODO 修正
    StockMailer.expiration_date_stock(user, stock).deliver
  end
end
