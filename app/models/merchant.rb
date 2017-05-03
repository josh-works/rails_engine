class Merchant < ApplicationRecord

  validates :name, presence: true

  has_many :invoices
  has_many :customers, through: :invoices

  def total_revenue
    binding.pry
    invoices.joins(:invoice_items).select("invoices.*, invoice_items.quantity * invoice_items.unit_price AS sub_total").
      group("id").
      sum("sub_total")
  end

end
