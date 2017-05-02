class Transaction < ApplicationRecord

  validates :invoice, presence: true
  validates :credit_card_number, presence: true
  validates :result, presence: true

  belongs_to :invoice

  enum status: [failed: 0, success: 1]

end
