Rails.application.routes.draw do
  resources :orders
  resources :statuses
  resources :customers
  resources :provinces
  resources :categories
  resources :pages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
