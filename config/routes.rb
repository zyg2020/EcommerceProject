Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
  # devise_for :users, controllers: { registrations: "users/registrations" }
  # Rails.application.routes.draw do
  #   devise_for :users, controllers: {
  #     sessions: "users/sessions"
  #   }
  # end

  root to: "products#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
