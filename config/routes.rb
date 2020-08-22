Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :credit_cards
  resources :users
end
