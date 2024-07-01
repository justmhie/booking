Rails.application.routes.draw do
  root 'hotels#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :bookings, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :hotels, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :reviews, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :room_types, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :room_types
end
