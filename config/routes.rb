Rails.application.routes.draw do
  resources :users
  resources :reviews
  resources :reservations
  resources :neighborhoods
  resources :listings
  resources :cities

  root 'listings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
