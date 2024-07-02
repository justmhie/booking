Rails.application.routes.draw do
  root 'hotels#index'  # Set the root path to the hotels list for guests

  # Sessions for login and logout
  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy', as: 'logout' 

  # User registration
  get 'signup', to: 'users#new', as: 'signup'
  resources :users, only: [:new, :create, :edit, :update, :show]

  # Bookings
  resources :bookings

  # Hotels and room types
  resources :hotels do
    resources :room_types, only: [:index, :show]
    resources :bookings, only: [:new, :create]
  end

  # Reviews
  resources :reviews

  # Admin Dashboard
  get 'admin_dashboard', to: 'admin#index'

  # Catch-all route for 404 errors
  match '*path', to: 'application#render_404', via: :all
end
