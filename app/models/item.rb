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
end
