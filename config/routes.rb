Rails.application.routes.draw do
  root 'endpoints#index'

  devise_for :users

  resources :endpoints
end
