class InvoiceItem < ApplicationRecord
  validates :quantity, :unit_price, presence: true

  belongs_to :item
  belongs_to :invoice

  def self.random
    id = InvoiceItem.pluck(:id).sample
    InvoiceItem.find(id)
  end
end
