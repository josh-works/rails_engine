require 'csv'
namespace :load_data do
  task :items => :environment do
    CSV.foreach('db/data/items.csv', headers: true) do |row|
      Item.create([
                  row.to_hash
                  ])
      puts "Created Item #{Item.last.id}"
    end
  end
  task :csvs => :environment do
    puts "loading merchants"
    CSV.foreach('db/data/merchants.csv', :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      Merchant.create([
                      :name => row['name']
                      ])
    end
    puts "loaded #{Merchant.all.count} merchants"

    puts "loading transactions"
    CSV.foreach('db/data/transactions.csv', :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      Transaction.create([
                          invoice_id: row['invoice_id'],
                          credit_card_number: row['credit_card_number'],
                          credit_card_expiration_date: row['credit_card_expiration_date'],
                          result: row['result'],
                          trans_created_at: row['created_at'],
                          trans_updated_at: row['updated_at']
                          ])
    end
    puts "loaded #{Transaction.all.count} transactions"

    puts "loading customers"
    CSV.foreach('db/data/customers.csv', :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      Customer.create([
                       first_name: row['first_name'],
                       last_name: row['last_name'],
                       cust_created_at: row['created_at'],
                       cust_updated_at: row['updated_at']
                       ])
    end
    puts "loaded #{Customer.all.count} customers"
  end
end
