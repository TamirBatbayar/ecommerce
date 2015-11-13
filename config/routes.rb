Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :products

  get '/search_by_categories/:category', to: 'products#index', as: 'search_by_category'

  namespace :master do
    resources :categories
    resources :roles
  end
end
