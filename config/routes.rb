# frozen_string_literal: false

Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products

  resources :offers, only: [] do
    patch :accept
    patch :decline
  end
end
