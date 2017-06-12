Rails.application.routes.draw do

  #Home
  root 'home#index'
  
  #Search
  get 'search' => 'search#search', as: :search

  #Standard routes 
  #TODO be more specific
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
  
  #API
  scope :api do
    post 'process_crawl' => 'api#process_crawl' 
    get 'test' => 'api#test'
  end
end
