class Transaction < ApplicationRecord
  validates :invoice, presence: true
  validates :credit_card_number, presence: true
  validates :result, presence: true

  belongs_to :invoice

  def self.random
    id = Transaction.pluck(:id).sample
    Transaction.find(id)
  end
  
end
