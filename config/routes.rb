Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/visas'
  get 'static_pages/forms'
  get 'static_pages/community'
end
