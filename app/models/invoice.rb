class Invoice < ApplicationRecord
  # scope :success, -> { joins(:transactions, :invoices).where(transactions: {result: "success"} ) }
  validates :status, presence: true

  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.random
    id = Invoice.pluck(:id).sample
    Invoice.find(id)
  end
end
