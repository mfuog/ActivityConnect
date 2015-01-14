Rails.application.routes.draw do

  root to: "visitors#index"
  get "profile", to: "users#show"

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users
  resources :activities
  resources :comments, only: [:create]
  resources :participations, only: [:create, :destroy]
end
