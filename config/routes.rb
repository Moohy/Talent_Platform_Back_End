Rails.application.routes.draw do

resources :profile

resources :services do
  resources :galleries
end
resources :categories

end
