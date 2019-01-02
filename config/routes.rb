Rails.application.routes.draw do
  root 'static_pages#home'
  get '/blogs', to: 'static_pages#blogs'
  get '/forum', to: 'static_pages#forum'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
