class Item < ApplicationRecord
  validates :name, :description, :unit_price, presence: true
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.random
    id = Item.pluck(:id).sample
    Item.find(id)
  end
end
