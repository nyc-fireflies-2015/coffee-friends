Rails.application.routes.draw do

  root 'cafes#index'

  get '/cafes/login' => 'cafe_sessions#new'
  post '/cafes/sessions' => 'cafe_sessions#create'
  delete '/cafes/logout' => 'cafe_sessions#destroy'
  get '/cafes/profile/:id' => 'cafes#show'

  resources :cafes, only: [:index, :show] do
    resources :menu_items, only: [:destroy, :create, :update]
    resources :coffee_gifts, only: [:new, :create]
  end

  get '/login' => 'user_sessions#new'
  post '/users/sessions' => 'user_sessions#create'
  delete '/logout' => 'user_sessions#destroy'
  get '/profile/:id' => 'users#show', as: 'profile'
  get '/register' => 'users#new'


  resources :users, only: [:create]
  resources :coffee_gifts, only: [:show]

end
