Rails.application.routes.draw do
  mount DobambamNotifications::API::Endpoint => '/api'

  root 'endpoints#index'

  devise_for :users

  resources :endpoints, except: :show
end
