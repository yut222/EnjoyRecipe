# Preview all emails at http://localhost:3000/rails/mailers/inventory
class InventoryMailerPreview < ActionMailer::Preview
  def expiration_date_stock
    InventoryMailer.expiration_date_stock
  end
end
