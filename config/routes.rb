Rails.application.routes.draw do
  root 'endpoints#index'

  devise_for :users

  resources :endpoints, except: :show
end
