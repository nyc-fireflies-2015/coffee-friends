Rails.application.routes.draw do

  root 'cafes#index'

  get '/cafes/login' => 'cafe_sessions#new'
  get '/cafes/profile' => 'cafes#show'

  resources :cafes, only: [:index, :show] do
    get '/borough' => 'cafes#borough'
    get '/neighborhood' => 'cafes#neighborhood'
    resources :coffee_gifts, only: [:new, :create]
  end

  resources :menu_items, only: [:destroy, :create, :update]
  resources :users, only: [:create, :edit, :update]
  resources :coffee_gifts, only: [:show, :update]

  get '/login' => 'user_sessions#new'
  post '/users/sessions' => 'user_sessions#create'
  delete '/logout' => 'user_sessions#destroy'
  get '/profile' => 'users#show'
  get '/register' => 'users#new'
  get '/confirmation/:id' => 'coffee_gifts#confirm', as: "confirmation"

  post '/cafes/sessions' => 'cafe_sessions#create'
  delete '/cafes/logout' => 'cafe_sessions#destroy'

end
