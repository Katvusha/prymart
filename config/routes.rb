# frozen_string_literal: false

Rails.application.routes.draw do
  root to: %(lists#index)
  resources :lists
  resources :offers
  resources :users
end
