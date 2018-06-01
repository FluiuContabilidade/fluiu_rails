Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: "registrations" }

  scope :users do
    get '/index', to:'users#index'
    get '/details/:id', to: 'users#show'
    get '/delete/:id', to: 'users#destroy'

    get '/:id/invoices_index', to: 'users#invoices_index'
    get '/:id/my_files', to: 'users#files'
    get '/:id/add_tax_files', to: 'users#add_tax_files'
    get '/:id/tax_files', to: 'users#tax_files'
    post '/:id/edit', to:'users#edit'

    ## 01/06/2018 - Added Opening Status Change routes
    get '/:id/opening_status_change', to: 'users#opening_status_change'
    post '/:id/opening_status_change', to: 'users#opening_status_change_post'

    #fix this - BAD modularization
    get '/:id/accounting_info', to: 'invoices#accounting_info'
    post '/:id/accounting_info', to: 'invoices#add_monthly_accounting_info'
  end

  scope :appointments do
    get '', to:'appointments#index'
    get '/new', to: 'appointments#new'
    post '/create', to: 'appointments#create'

    get ':id/edit', to: 'appointments#edit'
    patch ':id/edit', to: 'appointments#update'
    delete ':id/delete', to: 'appointments#delete', as: :appointment
  end

  scope :accounting_info do
    get '/', to: 'accounting_infos#new'
  end

  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
    get 'user/new', to: 'users#new'
    post 'user/create', to: 'users/registrations#custom_account_creation', as: :create_user
  end

  scope :invoices do
    scope :monthly do
      get ':id/:month', to: 'invoices#monthly_invoices'
      get ':id/:month/:type', to:'invoices#monthly_invoices_by_type'
      get ':id/:month/:type/:filter', to:'invoices#monthly_invoices_by_type'
    end

    scope :report do
      get 'individual/:id', to:'invoices#individual_report'
    end
  end

  root to: 'pages#home_page'
  get 'home', to: 'pages#home_page'
  get 'test', to: 'pages#test'

  ## USERS


end
