Rails.application.routes.draw do
  root 'static_pages#home'
  get '/visas', to: 'static_pages#visas'
  get '/forms', to: 'static_pages#forms'
  get '/community', to: 'static_pages#community'
  get '/signup', to: 'users#new'
  resources :users
end
