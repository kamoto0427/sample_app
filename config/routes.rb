Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :credit_cards, only: [:index, :new, :show]
end
