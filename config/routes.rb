# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resource :session, only: %i[new create destroy]
  resources :sessions, only: %i[new create show]
  root 'sessions#new'

  get 'new', to: 'users#new'
  get '/users/:user_id', to: 'users#show'

  get 'form', to: 'pages#form'
  get 'output', to: 'pages#output'
  get 'xml', to: 'pages#db_to_xml'
  get 'last_db_update', to: 'pages#last_db_update'
  get 'mersenne_info', to: 'pages#mersenne_info'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
