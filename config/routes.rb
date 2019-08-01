Rails.application.routes.draw do
  config = Rails.application.config.edamame
  
  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
      post 'session' => 'sessions#create', as: :session
      delete 'session' => 'sessions#destroy'
      resources :customers
      resource :account, except: [ :new, :create ]
      resource :password, only: [ :show, :edit, :update ]
      resource :check, only: [ :show, :edit, :update ]
  
      resources :histories
      resources :remittances
      
      resources :users, only: [ :edit, :update ]
      
      get 'roger_admin_history' => 'histories#roger'
      
      get 'purchase_admin_history' => 'histories#purchase'
      get 'chart_admin_history' => 'histories#chart'
      get 'reservation_admin_history' => 'histories#reservation'
      get 'reservation_history_admin_history' => 'histories#reservation_history'
      get 'undispatched_admin_history' => 'histories#undispatched'
     
      resource :guide do
        get :introduction
      end
    end
  end
  
  constraints host: config[:customer][:host] do
    namespace :customer, path: config[:customer][:path] do
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
      post 'session' => 'sessions#create', as: :session
      delete 'session' => 'sessions#destroy'
      resource :session, only: [ :new, :create, :destroy ]
      resources :customers
      resources :histories
      resource :remittance do
        get :deposit
      end
      
      
      get 'roger_customer_history' => 'histories#roger'
      get 'undispatched_customer_history' => 'histories#undispatched'
      resource :password, only: [ :show, :edit, :update ]
    
      resource :guide do
        get :introduction
        get :information
      end
    end
  end
  
  constraints host: config[:visitor][:host] do 
    namespace :visitor, path: config[:visitor][:path] do
      root 'top#index'
      resource :customer
      resources :histories
      
      #get 'histories/roger'
      get 'roger_visitor_history' => 'histories#roger'
       
      resource :guide do
        get :information
        get :introduction
        get :bank
      end
    end
  end
  
  root 'errors#routing_error'
  get '*anything' => 'errors#routing_error'
end
