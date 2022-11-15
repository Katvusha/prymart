# frozen_string_literal: false

Rails.application.routes.draw do
  root to: %(products#index)
  resources :products
  resources :offers
  resources :users
end
