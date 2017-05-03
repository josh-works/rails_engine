class Invoice < ApplicationRecord
  validates :status, presence: true

  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def order_total
    # Ack! Make this AR/SQL!
    invoice_items.reduce(0) do |sum, invoice_item|
      sum + invoice_item.quantity * invoice_item.unit_price
    end
  end

end
