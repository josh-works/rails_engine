
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show], :controller => "merchants/merchants" do
        collection do
          get "find", to: "merchants/merchants_find#show"
        end
      end
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show], :controller => "items/items" do
        collection do
          get "find", to: "items/items_find#show"
          get "find_all", to: "items/items_find#index"
          get "random", to: "items/items_random#show"
        end
      end
      resources :invoices, only: [:index, :show], :controller => "invoices/invoices" do
        collection do
          get "find", to: "invoices/invoices_find#show"
          get "find_all", to: "invoices/invoices_find#index"
          get "random", to: "invoices/invoices_random#show"
        end
      end
      resources :invoice_items, only: [:index, :show], :controller => "invoice_items/invoice_items" do
        collection do
          get "find", to: "invoice_items/invoice_items_find#show"
          get "find_all", to: "invoice_items/invoice_items_find#index"
          get "random", to: "invoice_items/invoice_items_random#show"
        end
      end
    end
  end
end
