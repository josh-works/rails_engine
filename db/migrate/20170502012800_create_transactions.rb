class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :invoice_id
      t.string :credit_card_number
      t.string :credit_card_expiration_date
      t.integer :result
      
      t.timestamps
    end
  end
end
