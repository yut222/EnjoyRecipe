namespace :expired_at_sendmail do  # namespaceはファイル名と同じにする
  desc '食材の賞味期限をメールで送信'  # descはタスクの説明文
  task mail_expiration_stock: :environment do  # taskの処理名。自分で命名する。
    # user = User.find(14) #TODO 修正
    # inventory = nil #TODO 修正
    InventoryMailer.expiration_date_stock(user).deliver
  end
end
