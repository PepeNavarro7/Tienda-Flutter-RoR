 

Rails.application.routes.draw do

  
  root 'sessions#index'

  resources :admins

  resources :contienes
  resources :carts
  resources :clientes
  resources :productos
  resources :tiendas
  
  namespace :api, defaults: { format: 'json' }  do
   namespace :v1 do
    resources :carts
    resources :clientes
    resources :contienes
    resources :tiendas
    resources :productos
   end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create' 
  get '/welcome', to: 'sessions#welcome'
  #get '/authorized', to: 'sessions#page_requires_login'
  get "/logout", to: "sessions#destroy", as: "logout"
  
  
  #post '/crear_carts', to: 'carts#create'
  #post '/carts', to: 'carts#create'

  #post '/api/v1/crear_carts', to: 'carts#create'
  #post '/api/v1/carts', to: 'carts#create'
   
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
