Rails.application.routes.draw do
  root "home#index"

  resources :examples
  resources :subscribers, only: [:create] do
    resource :confirmation, only: [:show], controller: :subscriber_confirmations
  end

  namespace :e1 do
    # Enline Edit
    resources :products, only: [:show] do
      resources :descriptions, only: [:edit, :update], controller: :product_descriptions
    end
  end

  namespace :e2 do
    # Modal
    resources :products, only: [:index, :new]
  end

  namespace :e3 do
    # Typehead searching
    resources :products, only: [:index]
  end

  namespace :e4 do
    # Lazy loading
    resources :products, only: [:show] do
      resources :orders, only: [:index], controller: :product_orders
    end
  end
end
