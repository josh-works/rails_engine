
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show], :controller => "items/items" do
        collection do
          get "find", to: "items/items_find#show"
        end
      end
      resources :invoices, only: [:index, :show], :controller => "invoices/invoices"
      resources :invoice_items, only: [:index, :show], :controller => "invoice_items/invoice_items"
    end
  end
end
