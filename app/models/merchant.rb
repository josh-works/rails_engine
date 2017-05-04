class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :invoices
  has_many :customers, through: :invoices

  def self.random
    id = Merchant.pluck(:id).sample
    Merchant.find(id)
  end

  def items
    Item.where(merchant_id: id)
  end

  def pending_customers
    Customer.joins(invoices: :transactions).where('invoices.merchant_id = ?', id).pluck('transactions.result')
    binding.pry
  end

  def favorite_customer
    Customer.joins(invoices: :transactions)
            .where('invoices.merchant_id = ? AND transactions.result = ?', id, 'success')
            .group('customers.id')
            .order('count("transactions.id") DESC')
            .first
  end

  def revenue
    invoices.joins(:invoice_items, :transactions).
    merge(Transaction.success).
    sum("unit_price * quantity")
  end

  def revenue_by_date(datetime)
    date = datetime.to_date
    invoices.joins(:invoice_items, :transactions).
    where(invoices: {created_at: date.beginning_of_day..date.end_of_day}).
    merge(Transaction.success).
    sum("unit_price * quantity")
  end

  def format_revenue
    format_unit_price(revenue)
  end

end
