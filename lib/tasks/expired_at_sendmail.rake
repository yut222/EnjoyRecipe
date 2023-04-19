namespace :expired_at_sendmail do  # namespaceはファイル名と同じにする
  desc '食材の賞味期限をメールで送信'  # descはタスクの説明文
  task mail_expiration_stock: :environment do  # taskの処理名。自分で命名する。
    Inventory.where(expiration_date: Date.today.since(3.days)).each do | inventory |
      InventoryMailer.expiration_date_stock(inventory.user, inventory).deliver
    end
  end
end
