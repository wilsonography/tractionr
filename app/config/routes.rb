App::Application.routes.draw do

  resources :line_items

  resources :companies

  resources :templates

  resources :comments

  resources :phases

  resources :accounts

  resources :attachments

  resources :deliverables

  resources :budgets

  resources :tasks

  resources :invoices

  resources :projects
  
  resources :users
  
  
  get   '/login', :to => 'sessions#login', :as => :login
  get   '/logout', :to => 'sessions#destroy', :as => :logout

  get '/', :to =>'dashboard#index', :as => :home
  
  # Omniauth routes
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  match '/auth/failure', :to => 'sessions#failure'
  
  
  
  
end
