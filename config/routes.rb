Rails.application.routes.draw do
  root 'static_pages#home'
  get '/visas', to: 'static_pages#visas'
  get '/forms', to: 'static_pages#forms'
  get '/community', to: 'static_pages#community'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
end
