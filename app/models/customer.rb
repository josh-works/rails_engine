class Customer < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true

    has_many :invoices
    has_many :merchants, through: :invoices

    def self.random
      id = Customer.pluck(:id).sample
      Customer.find(id)
    end

    def transactions
      Transaction.joins(:invoice).where('invoices.customer_id = ?', id)
    end
end
