Rails.application.routes.draw do

  root 'cafes#index'

  get '/cafes/login' => 'cafe_sessions#new'
  get '/cafes/profile' => 'cafes#show'

  resources :cafes, only: [:index, :show] do
    resources :menu_items, only: [:destroy, :create, :update]
    resources :coffee_gifts, only: [:new, :create]
  end

  get '/login' => 'user_sessions#new'
  post '/users/sessions' => 'user_sessions#create'
  delete '/logout' => 'user_sessions#destroy'
  get '/profile' => 'users#show'
  get '/register' => 'users#new'


  post '/cafes/sessions' => 'cafe_sessions#create'
  delete '/cafes/logout' => 'cafe_sessions#destroy'


  resources :users, only: [:create]
  resources :coffee_gifts, only: [:show]

  #omniauth
  match 'auth/:provider/callback', to: 'facebook_sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'facebook_sessions#destroy', as: 'signout', via: [:get, :post]

end
