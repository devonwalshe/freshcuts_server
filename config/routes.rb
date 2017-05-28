Rails.application.routes.draw do
  root 'home#index'

  get 'search' => 'search#search', as: :search

  resources :post_categories
  resources :posts
  resources :product_categories
  resources :tags
  resources :affiliateproducts
  resources :affiliates
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
