Rails.application.routes.draw do
  root 'profile#index'
  resources :profile

  get 'profile', to: 'profile#index'
end
