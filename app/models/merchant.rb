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

end
