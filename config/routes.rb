Rails.application.routes.draw do
  devise_for :users
  resources :order_products
  resources :product_categories
  resources :products
  resources :orders
  resources :statuses
  resources :customers
  resources :provinces
  resources :categories
  resources :pages

  root to: "products#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
