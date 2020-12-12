Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/subscriptions/alphabetical' => 'subscriptions#alphabetical'
  get '/subscriptions/price' => 'subscriptions#price'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :subscriptions do
    resources :payments
  end
  resources :credit_cards
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
