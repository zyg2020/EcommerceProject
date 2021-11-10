Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "sessions/new"
  get "sessions/create"
  get "sessions/login"
  get "sessions/welcome"
  resources :order_products
  resources :product_categories
  resources :products
  resources :orders
  resources :statuses
  resources :customers
  resources :provinces
  resources :categories
  resources :pages

  root "sessions#welcome"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get "/welcome", to: "sessions#welcome"
end
