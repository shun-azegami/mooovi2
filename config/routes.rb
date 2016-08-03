TechReviewSite::Application.routes.draw do

  get 'products' => 'products#index'
  get 'products/search' => 'products#search'
  get 'products/:id' => 'products#show'
  get 'products/:product_id/reviews/new' => 'reviews#new'
  post 'products/:product_id/reviews' => 'reviews#create'

  root 'products#index'

end
