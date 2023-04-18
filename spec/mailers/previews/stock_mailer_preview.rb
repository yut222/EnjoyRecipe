# Preview all emails at http://localhost:3000/rails/mailers/stock_mailer
class StockMailerPreview < ActionMailer::Preview
  def expiration_date_stock
    StockMailer.expiration_date_stock
  end
end
