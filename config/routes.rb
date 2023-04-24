Rails.application.routes.draw do
  root "home#index"

  resources :examples

  namespace :e1 do
    # Enline Edit
    resources :products, only: [:show] do
      resources :descriptions, only: [:edit, :update], controller: :product_descriptions
    end
  end
end
