Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get "sessions/new"
  # get "sessions/create"
  # get "sessions/login"
  # get "sessions/welcome"
  resources :order_products
  resources :product_categories
  resources :products do
    collection do
      get "new_products"
      get "on_sale"
      get "recently_updated"
      get "search"
    end
  end
  resources :orders
  resources :statuses
  resources :customers
  resources :provinces
  resources :categories
  resources :pages, except: [:show]
  resources :cart, only: %i[create destroy]
  get "/pages/:permalink" => "pages#permalink", as: "permalink"

  root "sessions#welcome"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get "/welcome", to: "sessions#welcome"

  get "/products_in_cart", to: "cart#index", as: "products_in_cart"
end
