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
  post "/change_quantity", to: "cart#change_quantity",
                           as: "change_quantity"

  scope "/checkout" do
    post "create",  to: "checkout#create", as: "checkout_create"
    get  "success", to: "checkout#success", as: "checkout_success"
    get  "cancel",  to: "checkout#cancel",  as: "checkout_cancel"
  end
end
