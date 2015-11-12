Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :products

  namespace :master do
    resources :categories
    resources :roles
  end
end
