# frozen_string_literal :true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  resources :invoices
  resources :invoices_products
  resources :checkouts
  root to: 'products#index'
  get '*path' => redirect('/')
end