# frozen_string_literal: false

Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'

  resources :products do
    resources :offers, only: %i[new create]
  end
  resources :offers, only: [:index]
end
