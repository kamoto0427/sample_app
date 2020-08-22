Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :credit_cards do
    collection do
      post 'show', to: 'credit_card#show'
      post 'create', to: 'credit_card#create'
      post 'delete', to: 'credit_card#delete'
    end
  end
  resources :users
end
