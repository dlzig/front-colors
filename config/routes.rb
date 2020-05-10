Rails.application.routes.draw do
  root "artworks#index"
  resources :artworks
  resources :color, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
