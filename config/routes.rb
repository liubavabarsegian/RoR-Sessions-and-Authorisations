Rails.application.routes.draw do
  resources :users
  resource :session, only: %i[new create destroy]
  root 'sessions#new'

  get 'login', to: 'sessions#new'
  get 'new', to: 'users#new'
  get 'logout', to: 'sessions#destroy'


  get 'form', to: 'pages#form'
  get 'output', to: 'pages#output'
  get 'xml', to: 'pages#db_to_xml'
  get 'last_db_update', to: 'pages#last_db_update'
  get 'mersenne_info', to: 'pages#mersenne_info'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
