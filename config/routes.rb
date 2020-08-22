Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :credit_cards do
    collection do
      post 'show', to: 'creditCard#show'
      post 'create', to: 'creditCard#create'
      post 'delete', to: 'creditCard#delete'
    end
  end
  resources :users
end
