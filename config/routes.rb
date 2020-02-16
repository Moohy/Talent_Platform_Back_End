Rails.application.routes.draw do
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
  path: '',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'api/v1/sessions',
    registrations: 'api/v1/registrations'
  },defaults: { format: :json }

  get "is_loggedin", to: "api#is_loggedin"
  get "user_type", to: "api#user_type"

  namespace :api do
    namespace :v1 do
      get "user_services", to: "services#user_services"
      get "user_offers", to: "offers#user_offers"
      resources :services do
        
        resources :galleries
        resources :offers do
          get "accept_offer", to: "offers#accept"
          get "decline_offer", to: "offers#decline"
          resources :payments
        end
      end
      resources :categories, only: [:show, :index]
      namespace :admin do
        resources :roles, except: :show
        resources :categories
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# api/v1/services/1/offers/1/payments
# api/v1/user_services
# api/v1/categories/