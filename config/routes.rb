Rails.application.routes.draw do

  root 'cafes#index'

  get '/cafes/login' => 'cafe_sessions#new'
  get '/cafes/profile' => 'cafes#show'
  post '/cafes/borough' => 'cafes#borough'
  post '/cafes/neighborhood' => 'cafes#neighborhood'
  post '/coffee_gifts/filter' => 'coffee_gifts#filter'

  resources :cafes, only: [:index, :show] do
    resources :coffee_gifts, only: [:new, :create]
  end

  resources :menu_items, only: [:destroy, :create, :update]
  resources :users, only: [:create]
  resources :coffee_gifts, only: [:show, :update]
  resources :transactions, only: [:new, :create]

  get '/login' => 'user_sessions#new'
  post '/users/sessions' => 'user_sessions#create'
  delete '/logout' => 'user_sessions#destroy'
  get '/profile' => 'users#show'
  get '/register' => 'users#new'
  get '/confirmation/:id' => 'coffee_gifts#confirm', as: "confirmation"

  get '/redemption_confirmation/:id' => 'coffee_gifts#confirm_redemption', as: "redemption_confirmation"

  post '/cafes/sessions' => 'cafe_sessions#create'
  delete '/cafes/logout' => 'cafe_sessions#destroy'

end
