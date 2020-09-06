Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items do 
    member do
      post 'buy'
      get 'confirm'
      get 'bought'
    end
  end

  resources :credit_cards do
    collection do
      post 'show', to: 'credit_card#show'
      post 'create', to: 'credit_card#create'
      post 'delete', to: 'credit_card#delete'
    end
  end
end
