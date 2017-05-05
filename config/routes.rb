
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show], :controller => "merchants/merchants" do
        get "items", to: "merchants/merchant_items#index"
        get "invoices", to: "merchants/merchant_invoices#index"
        get "customers_with_pending_invoices", to: "merchants/merchant_pending_customers#index"
        get "favorite_customer", to: "merchants/merchant_favorite_customer#show"
        get "revenue", to: "merchants/merchant_revenue#show"
        collection do
          get "most_items", to: "merchants/merchants_most_items#index"
          get "most_revenue", to: "merchants/merchants_most_revenue#index"
          get "revenue", to: "merchants/merchants_revenue#show"
          get "find", to: "merchants/merchants_find#show"
          get "find_all", to: "merchants/merchants_find#index"
          get "random", to: "merchants/merchants_random#show"
        end
      end
      resources :transactions, only: [:index, :show], :controller => "transactions/transactions" do
        get "invoice", to: "transactions/transaction_invoice#show"
        collection do
          get "find", to: "transactions/transactions_find#show"
          get "find_all", to: "transactions/transactions_find#index"
          get "random", to: "transactions/transactions_random#show"
        end
      end
      resources :customers, only: [:index, :show], :controller => "customers/customers" do
        get "invoices", to: "customers/customer_invoices#index"
        get "transactions", to: "customers/customer_transactions#index"
        collection do
          get "find", to: "customers/customers_find#show"
          get "find_all", to: "customers/customers_find#index"
          get "random", to: "customers/customers_random#show"
        end
      end
      resources :items, only: [:index, :show], :controller => "items/items" do
        get "invoice_items", to: "items/items_invoice_items#index"
        get "merchant", to: "items/items_merchants#show"
        collection do
          get "most_revenue", to: "items/most_revenue_items#index"
          get "find", to: "items/items_find#show"
          get "find_all", to: "items/items_find#index"
          get "random", to: "items/items_random#show"
        end
      end
      resources :invoices, only: [:index, :show], :controller => "invoices/invoices" do
        get "transactions", to: "invoices/invoice_transactions#index"
        get "invoice_items", to: "invoices/invoice_invoice_items#index"
        get "items", to: "invoices/invoice_items#index"
        get "customer", to: "invoices/invoice_customers#show"
        get "merchant", to: "invoices/invoice_merchants#show"
        collection do
          get "find", to: "invoices/invoices_find#show"
          get "find_all", to: "invoices/invoices_find#index"
          get "random", to: "invoices/invoices_random#show"
        end
      end
      resources :invoice_items, only: [:index, :show], :controller => "invoice_items/invoice_items" do
        get "item", to: "invoice_items/invoice_items_items#show"
        get "invoice", to: "invoice_items/invoice_items_invoices#show"
        collection do
          get "find", to: "invoice_items/invoice_items_find#show"
          get "find_all", to: "invoice_items/invoice_items_find#index"
          get "random", to: "invoice_items/invoice_items_random#show"
        end
      end
    end
  end
end
