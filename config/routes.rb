Rails.application.routes.draw do
  devise_for :users,
  path: '/api/v1/',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'api/v1/sessions',
    registrations: 'api/v1/registrations'
  } do
    resources :profile
  end

  namespace :api do
    namespace :v1 do
      resources :services do
        resources :galleries
      end
      resources :categories, only: [:show, :index]
      namespace :admin do
        resources :roles, except: :show
        resources :categories
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :payments
  resources :offers
end
