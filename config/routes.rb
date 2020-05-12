Rails.application.routes.draw do

  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :artworks
  resources :colors, only: [:create, :destroy, :show] 
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
