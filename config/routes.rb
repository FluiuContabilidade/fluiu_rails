Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: "registrations" }

  scope :users do
    get '/index', to:'users#index'
    get '/details/:id', to: 'users#show'
    get '/delete/:id', to: 'users#destroy'
  end

  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
    get 'user/new', to: 'users#new'
    post 'user/create', to: 'users/registrations#custom_account_creation', as: :create_user
  end

  root to: 'pages#home_page'
  get 'home', to: 'pages#home_page'


  ## USERS


end
