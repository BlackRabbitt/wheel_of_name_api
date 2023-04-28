# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :healthz, only: [:index]
  resources :items, only: [] do
    get :random, on: :collection
  end
end
