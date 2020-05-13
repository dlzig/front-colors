Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :artworks
  resources :colors, only: [:create, :destroy, :show] 
  resources :users do
    member do
      get :likes
    end
  end
  
  resources :favorites, only: [:create, :destroy] 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
