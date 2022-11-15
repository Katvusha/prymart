# frozen_string_literal: false

Rails.application.routes.draw do
  root to: %(product#index)
  resources :products
  resources :offers
  resources :users
end
