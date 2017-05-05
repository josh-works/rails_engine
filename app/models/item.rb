class Item < ApplicationRecord
  validates :name, :description, :unit_price, presence: true
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.random
    id = Item.pluck(:id).sample
    Item.find(id)
  end

  def self.most_revenue(quantity)
    Item.select("items.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total")
        .joins(:invoice_items)
        .group(:id)
        .order("total DESC")
        .limit(quantity.to_i)
  end

  def self.top_by_number_sold(quantity = 5)
    Item.select("items.*").
        joins(:invoice_items).
        group("invoice_items.item_id").
        order("sum(invoice_items.quantity) DESC").
        limit(quantity)
  end

  def best_day
    # InvoiceItem.find_by_sql("SELECT i.created_at, SUM(unit_price * quantity) AS sales
    #            FROM invoice_items ii
    #            JOIN invoices i ON i.id = ii.invoice_id
    #            JOIN transactions t ON t.invoice_id = i.id
    #            WHERE item_id = 1099 AND t.result = 'success'
    #            GROUP BY i.created_at
    #            ORDER BY sales DESC, i.created_at DESC;")
  end
end
