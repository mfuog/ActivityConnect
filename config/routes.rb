Rails.application.routes.draw do

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :activities
  resources :comments, only: [:create]
  resources :participations, only: [:create, :destroy]
end
