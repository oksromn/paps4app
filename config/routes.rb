Rails.application.routes.draw do
  devise_for :users

  resources :films
  resources :comments, only: :create
  resources :ratings, only: :create

  root to: 'films#index'
end
