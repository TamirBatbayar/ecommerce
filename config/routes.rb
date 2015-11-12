Rails.application.routes.draw do
  namespace :master do
    resources :categories
  end
  namespace :master do
    resources :roles
  end
  resources :products
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
