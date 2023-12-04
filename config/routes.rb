Rails.application.routes.draw do
  get 'search/index',to: 'search#index', as: 'search'
  post 'search/index'
  get 'admin/index'

  # get 'authenticate/login'
  # get 'authenticate/checkpassword'
  # get 'authenticate/logout'

  get 'access/create'
  get 'access/destroy'
  get 'access/new'
  post 'access/new', to: 'access#create'

  resources :users
  resources :orders
  resources :lineitems
  resources :carts
  get 'shopper/index'
  root "shopper#index", as: "shopper"
  resources :products

  get 'products/:id/details', to: 'products#details', as: 'product_details'

  get 'access/create'
  get 'access/destroy'

  get '/shopper' => 'shopper#index'
  get '/admin', to: 'products#index', as: 'admin'
  get '/admin/orders', to: 'orders#index', as: 'admin_orders'


  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'access#new'
  post '/login' => 'access#create'
  get '/logout' => 'access#destroy'
  post '/logout' => 'access#destroy'

  get 'user/:id/profile', to: 'users#profile', as: 'user_profile'

end
