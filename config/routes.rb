TechReviewSite::Application.routes.draw do

  get 'products' => 'products#index'
  get 'products/search' => 'products#search'
  get 'products/:id' => 'products#show'

  root 'products#index'

end
