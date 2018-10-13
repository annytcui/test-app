Rails.application.routes.draw do
  get 'users/new'

  root 'static_pages#home'
  get 'visas', to: 'static_pages#visas', as: :visas
  get 'forms', to: 'static_pages#forms', as: :forms
  get 'community', to: 'static_pages#community', as: :community
  resources :users
end
