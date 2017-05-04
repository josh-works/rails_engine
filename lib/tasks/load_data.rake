require 'csv'

class Loader
  def self.seed_merchants
    CSV.foreach('db/data/merchants.csv', :headers => true) do |row|
      Merchant.create!([row.to_hash])
      puts "Created Merchant #{Merchant.last.id}"
    end
  end

  def self.seed_invoices
    CSV.foreach('db/data/invoices.csv', :headers => true) do |row|
      Invoice.create!([row.to_hash])
      puts "Created Invoice #{Invoice.last.id}"
    end
  end

  def self.seed_transactions
    CSV.foreach('db/data/transactions.csv', :headers => true) do |row|
          Transaction.create!([row.to_hash])
      puts "Created Transaction #{Transaction.last.id}"
    end
  end

  def self.seed_customers
    CSV.foreach('db/data/customers.csv', :headers => true) do |row|
      Customer.create!([row.to_hash])
      puts "Created Customer #{Customer.last.id}"
    end
  end

  def self.seed_items
    CSV.foreach('db/data/items.csv', :headers => true) do |row|
      Item.create!([row.to_hash])
      puts "Created Item #{Item.last.id}"
    end
  end


  def self.seed_invoice_items
    CSV.foreach('db/data/invoice_items.csv', :headers => true) do |row|
      InvoiceItem.create!([row.to_hash])
      puts "Created InvoiceItem #{InvoiceItem.last.id}"
    end
  end

end


namespace :load_data do
  task :all => :environment do
    Loader.seed_merchants
    Loader.seed_customers
    Loader.seed_invoices
    Loader.seed_transactions
    Loader.seed_items
    Loader.seed_invoice_items
  end
  task :merchants => :environment do
    Loader.seed_merchants
  end
  task :customers => :environment do
    Loader.seed_customers
  end
  task :invoices => :environment do
    Loader.seed_invoices
  end
  task :transactions => :environment do
    Loader.seed_transactions
  end
  task :items => :environment do
    Loader.seed_items
  end
  task :invoice_items => :environment do
    Loader.seed_invoice_items
  end
end
