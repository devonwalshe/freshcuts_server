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
  resources :pages

  ### Content
  get 'meaty_tales' => "pages#home", as: :content
  
end
