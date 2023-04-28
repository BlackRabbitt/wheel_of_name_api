# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :healthz, only: [:index]
  resources :items, only: %i[create] do
    get :random, on: :collection
  end

  resources :rooms, only: %i[create show] do
    member do
      get :result
    end
  end
end
