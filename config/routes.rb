Rails.application.routes.draw do
  devise_for :users

  get 'prototypes/index'
  root to: "prototypes#index"
  post 'prototype/new'
  resources :prototypes, only: [:index, :new, :create]
end
